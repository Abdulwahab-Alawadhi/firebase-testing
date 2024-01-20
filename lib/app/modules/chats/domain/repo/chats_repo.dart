import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/app/modules/chats/domain/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MyUser>> fetchRegisteredUsers() async {
    try {
      String currentUserId = FirebaseAuth.instance.currentUser!.uid;

// Query with a filter to exclude the current user
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('userId', isNotEqualTo: currentUserId) // Add the filter here
          .get();
      List<MyUser> userList = querySnapshot.docs
          .map((doc) => MyUser.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return userList;
    } catch (e) {
      debugPrint('Error fetching users: $e');
      return [];
    }
  }
}
