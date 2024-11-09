
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';

class UserRepository{

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> signUp(String password, String email, String name) async {
    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email.trim(),
        data: {'displayName': name.trim()},
      );

      if (response.user == null) {
        throw Exception('Sign up failed');
      }
    } catch (error) {

      if (error is PostgrestException && error.message.contains('duplicate key value violates unique constraint')) {
        throw Exception('An account with this email already exists');
      } else {
        throw Exception('Sign up failed: ${error.toString()}');
      }
    }
  }

  Future<bool> signIn(String email, String password, BuildContext context) async{
    try{
      final AuthResponse response = await supabase.auth.signInWithPassword(
          password: password,
          email: email.trim()
      );

      final Session? session = response.session;
      final User? user = response.user;

      if (user != null) {
        await _storage.write(key: 'authToken', value: session?.accessToken);
        return true;
      } else {
        return false;
      }

    } catch (e) {
      print('Sign in error: $e');
      return false;
    }
    }

  Future<void> signOut(BuildContext context) async{
    supabase.auth.signOut();
    await _storage.write(key: 'authToken', value: '');
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);


  }

  Future<void> resetPassword(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(
        email,
        redirectTo: 'http://yourdomain.com/reset-password',
      );
    } catch (e) {
      print('Reset password error: $e');
      rethrow;
    }
  }



}