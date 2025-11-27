import 'package:ai_academy/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUser(AppUser user) async {
    try {
      print('Attempting to save user with UID: ${user.uid}');
      await _firestore.collection('users').doc(user.uid).set(user.toMap());
      print('User saved to Firestore successfully');
    } catch (e) {
      print('Firestore save error: $e');
      print('Error type: ${e.runtimeType}');
      rethrow;
    }
  }

  Future<AppUser?> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return AppUser.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Firestore get error: $e');
      return null;
    }
  }
}
