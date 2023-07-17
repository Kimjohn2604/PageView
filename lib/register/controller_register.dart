import 'package:app/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/component/toast.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});
  Future<void> handleRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.user;
    String email = state.email;
    String password = state.password;
    String repassword = state.repassword;
    if (username.isEmpty) {
      toastLogin(msg: "You need to fill your Username");
      return;
    }
    if (email.isEmpty) {
      toastLogin(msg: "You need to fill your email address");
      return;
    }
    if (password.isEmpty) {
      toastLogin(msg: "You need to fill your Password");
      return;
    }
    if (repassword.isEmpty) {
      toastLogin(msg: "You need to confirm your Password");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastLogin(msg: "An code has beem send to your registered email. Please to activate it");
        Navigator.of(context).pop();
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastLogin(msg: "Your password is too weak");
        return;
      } else if (e.code == 'email-already-in-use') {
        toastLogin(msg: "Your email is already in use");
        return;
      } else if (e.code == 'invalid-email') {
        toastLogin(msg: "your email format is invalid");
        return;
      }
    }
  }
}
