import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final SharedPreferences _prefs;

  UserRepository(this._prefs);

  Future<User> signIn({required String email, required String password}) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveAuthStatus(true);

      final userDoc =
          await _firestore.collection('users').doc(authResult.user!.uid).get();
      final displayName = userDoc['name'] as String;

      await authResult.user!.updateDisplayName(displayName);

      await _saveUserInfo(authResult.user!);

      return authResult.user!;
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<User> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final UserCredential authResult =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = authResult.user!;

      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': name,
        'email': email,
      });

      await authResult.user!.updateDisplayName(name);
      await _saveAuthStatus(true);
      await _saveUserInfo(authResult.user!);

      return user;
    } catch (e) {
      await _saveAuthStatus(false);
      throw Exception('Failed to sign up: $e');
    }
  }

  Future<User> getUser() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        // Load user information from SharedPreferences
        final userInfo = getUserInfo();
        user.updateEmail(userInfo['email']!);
        user.updateDisplayName(userInfo['name']!);
      }
      return user!;
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _clearAuthStatus();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  Future<bool> isAuthenticated() async {
    return _prefs.getBool('isAuthenticated') ?? false;
  }

  Future<void> _saveAuthStatus(bool isAuthenticated) async {
    await _prefs.setBool('isAuthenticated', isAuthenticated);
  }

  Future<void> _clearAuthStatus() async {
    await _prefs.remove('isAuthenticated');
  }

  Future<void> _saveUserInfo(User user) async {
    await _prefs.setString('userEmail', user.email ?? '');
    await _prefs.setString('userName', user.displayName ?? '');
  }

  Map<String, String> getUserInfo() {
    final email = _prefs.getString('userEmail') ?? '';
    final name = _prefs.getString('userName') ?? '';

    return {'email': email, 'name': name};
  }
}
