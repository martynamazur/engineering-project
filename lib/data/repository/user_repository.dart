
import 'dart:developer' as develoepr;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';
import '../../model/result.dart';
import '../../utils/log.dart';

class UserRepository{

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Result> signUp(String password, String email, String name) async {
    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email.trim(),
        data: {'displayName': name.trim()},
      );

      if (response.user == null) {
        return Result.failure('Sign up failed. No user returned');
      }

      return Result.success();
    } catch (error) {

      if (error is PostgrestException && error.message.contains('duplicate key value violates unique constraint')) {
        return Result.failure('An account with this email already exists');
      } else {
        throw Result.failure('Unexpected error during sign up.');
      }
    }
  }

  Future<Result> signIn(String email, String password) async{
    try{
      final AuthResponse response = await supabase.auth.signInWithPassword(
          password: password,
          email: email.trim()
      );

      final Session? session = response.session;
      final User? user = response.user;


      if (user != null) {
        await _storage.write(key: 'authToken', value: session?.accessToken);
        await updateAccountStatus();
        logger.i('Zalogowano użytkownika: ${user.id}');
        return Result.success();
      }

      logger.w('Sign in failed, no user returned');
      return Result.failure('Something went wrong. Try again');

    } catch (e, stack) {
      logger.i('Sign in error: $e $stack');
      return Result.failure('Something went wrong. Try again');
    }
    }

  Future<Result> signOut() async{
    try{
      await supabase.auth.signOut();
      //await _storage.write(key: 'authToken', value: '');
      await _storage.delete(key: 'authToken');
      return Result.success();

    }catch(e, stack){
      logger.i('Error while signing out: $e, $stack');
      return Result.failure('Something went wrong. Try again');
    }

  }

  Future<Result> resetPassword(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(
        email,
        //redirectTo: 'http://yourdomain.com/reset-password',
      );
      return Result.success();
    } catch (e, st) {
      logger.i('Reset password error: $e, $st');
      return Result.failure('Something went wrong. Try again');
    }
  }


  Future<Result> changeEmailAddress(String newEmailAddress) async{
    try{
      await supabase.auth.updateUser(UserAttributes(email: newEmailAddress));
      return Result.success();
    }on AuthException catch(e,stack){
      if (e.message.contains('already registered')) {
        return Result.failure('This email address is already in use.');
      }
      logger.i('Auth error: $e, $stack');
      return Result.failure('Something went wrong. Please try again.');
    } catch(e, stack){
      logger.i('Change email address - unexpected error: $e, $stack');
      return Result.failure('Something went wrong');
    }
  }


  Future<Result> requestAccountDeletion() async {
    try{
      final userId = supabase.auth.currentUser?.id;

      if (userId == null) {
        return Result.failure('User is not logged in');
      }
      await supabase
          .from('users')
          .update({'is_deletable': true})
          .eq('id', userId);

      return Result.success();
    }catch(e,stack){
      logger.e('Error during account deletion request: $e\n$stack');
      return Result.failure('Failed to request account deletion. Please try again.');
    }


  }
  Future<void> updateAccountStatus() async{
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    await supabase.from('users').update({
      'account_status': 'active',
      'is_deletable': false,
      'deletion_requested_at': null,
    }).eq('id', userId);
  }



}