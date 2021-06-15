import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:na_vegano/models/item_cart.dart';
import 'package:na_vegano/models/item_menu.dart';
import 'package:na_vegano/models/user_model.dart';
import 'package:na_vegano/services/auth_service.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  static StreamSubscription<QuerySnapshot> listen;

  Future<void> saveUser(UserModel user) {
    return _db.collection("users").doc(user.uid).set(
          user.toMap(),
        );
  }

  void listenItems(callback) {
    _db.collection('items').snapshots().listen((snapshot) {
      callback(snapshot.docs
          .map((doc) => ItemMenu.fromFirestore({"id": doc.id, ...doc.data()}))
          .toList());
    });
  }

  void listenItemById(id, callback) {
    _db.collection('items').doc(id).snapshots().listen((doc) {
      if (!doc.exists)
        callback(null);
      else
        callback(ItemMenu.fromFirestore({"id": doc.id, ...doc.data()}));
    });
  }

  Future<ItemMenu> getItemById(id) {
    return _db.collection('items').doc(id).get().then((doc) {
      if (!doc.exists)
        return null;
      else
        return ItemMenu.fromFirestore({"id": doc.id, ...doc.data()});
    });
  }

  Future<void> setItemCart(ItemCart item) async {
    return _db
        .collection('carts')
        .doc(AuthService.getCurrentUser().uid)
        .snapshots()
        .first
        .then(
          (value) => {
            value.reference.collection('items').doc(item.item.id).set(
              {'quantity': item.quantity},
              SetOptions(merge: true),
            )
          },
        );
  }

  Future<void> updateQuantityItemCart(String id, int increment,
      {double quantity = 2}) {
    if (quantity > 1) {
      return _db
          .collection('carts')
          .doc(AuthService.getCurrentUser().uid)
          .collection('items')
          .doc(id)
          .update(
        {'quantity': FieldValue.increment(increment)},
      );
    } else {
      return _db
          .collection('carts')
          .doc(AuthService.getCurrentUser().uid)
          .collection('items')
          .doc(id)
          .delete();
    }
  }

  Future<void> listenItemsCart(callback) async {
    return _db
        .collection('carts')
        .doc(AuthService.getCurrentUser().uid)
        .snapshots()
        .first
        .then(
          (value) => {
            listen = value.reference
                .collection('items')
                .snapshots()
                .listen((snap) async {
              if (snap.docs.isEmpty) {
                callback(List<ItemCart>.empty());
              } else {
                var items = await Future.wait(snap.docs.map(
                  (item) async {
                    ItemMenu itemMenu = await this.getItemById(item.id);
                    return ItemCart(
                      id: item.id,
                      item: itemMenu,
                      quantity: double.parse(
                        item.data()['quantity'].toString(),
                      ),
                    );
                  },
                ));
                callback(items);
              }
            })
          },
        );
  }
}
