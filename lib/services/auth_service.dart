import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ruwad_rewatib/screens/home_page.dart';
import 'package:ruwad_rewatib/screens/login_page.dart';
import 'package:toastification/toastification.dart';

class AuthService {
  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // After successful signup, redirect to sign-in page
      context.go('/signin');
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = 'An unexpected error occurred. Please try again.';
      }
      toastification.show(
        context: context,
        title: const Text('Error'),
        description: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        alignment: Alignment.bottomCenter,
        autoCloseDuration: const Duration(seconds: 2),
      );
    } catch (e) {
      // Handle other errors
      print(e);
    }
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigate to home page after successful sign-in
      context.go('/home');
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = 'An unexpected error occurred. Please try again.';
      }
      toastification.show(
        context: context,
        title: const Text('Error'),
        description: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        alignment: Alignment.bottomCenter,
        autoCloseDuration: const Duration(seconds: 2),
      );
    } catch (e) {
      // Handle other errors
      print(e);
    }
  }

  Future<void> signout(
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.signOut();
      MaterialPageRoute(builder: (context) => const LoginPage());
    } catch (e) {
      print(e);
    }
  }

  void redirectToAppropriatePage(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // User is not logged in, redirect to sign-in page
      context.go('/signin');
    } else {
      // User is logged in, redirect to home page
      context.go('/home');
    }
  }
}
