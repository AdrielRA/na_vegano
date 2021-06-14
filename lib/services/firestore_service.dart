import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:na_vegano/models/item_menu.dart';
import 'package:na_vegano/models/user_model.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

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
}
