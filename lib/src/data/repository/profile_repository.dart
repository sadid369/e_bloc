import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_bloc/src/data/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<UserModel?> fetchUserFromFirestore() async {
    UserModel? user;
    try {
      final userData = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (userData.data() != null) {
        user = UserModel.fromMap(userData.data()!);
        debugPrint("Error signing in with Google: ${user.userName}");
      }
      return user;
    } catch (error) {
      debugPrint("Error signing in with Google: $error");
      return null;
    }
  }
}
