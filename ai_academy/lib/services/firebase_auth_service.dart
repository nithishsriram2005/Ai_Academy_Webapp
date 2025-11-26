import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; 
    } catch (e) {
      if (e.toString().contains('email-already-in-use')) {
        return 'Email already exists. Please sign in instead.';
      } else if (e.toString().contains('weak-password')) {
        return 'Password is too weak. Use at least 6 characters.';
      } else if (e.toString().contains('invalid-email')) {
        return 'Invalid email format.';
      }
      return 'Sign up failed. Please try again.';
    }
  }

  static Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; 
    } catch (e) {
      if (e.toString().contains('user-not-found')) {
        return 'No account found. Please create an account first.';
      } else if (e.toString().contains('wrong-password')) {
        return 'Incorrect password. Please try again.';
      } else if (e.toString().contains('invalid-email')) {
        return 'Invalid email format.';
      }
      return 'Sign in failed. Please check your credentials.';
    }
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      UserCredential userCredential = await _auth.signInWithPopup(googleProvider);
      
      if (userCredential.user != null) {
        await _storeUserData(userCredential.user!);
      }
      
      return userCredential;
    } catch (e) {
      print('Google Sign-In failed: $e');
      return null;
    }
  }

  static Future<void> _storeUserData(User user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'name': user.displayName ?? '',
        'email': user.email ?? '',
        'photoUrl': user.photoURL ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error storing user data: $e');
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  static bool isUserSignedIn() {
    return _auth.currentUser != null;
  }
}