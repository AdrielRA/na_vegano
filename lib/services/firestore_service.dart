import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:na_vegano/models/user_model.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUser(UserModel user) {
    return _db.collection("users").doc(user.uid).set(
          user.toMap(),
        );
  }
}
