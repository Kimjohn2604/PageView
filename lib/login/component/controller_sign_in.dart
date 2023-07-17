import 'package:app/login/component/toast.dart';
import 'package:app/login/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/constant.dart';
import '../../service/global.dart';

class SigninController {
  final BuildContext context;
  SigninController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailNew = state.email;
        String passNew = state.password;
        if (emailNew.isEmpty) {
          toastLogin(msg: "You need to fill your Email Account");
          return;
        }
        if (passNew.isEmpty) {
          toastLogin(msg: "You need to fill your Password Account");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: emailNew, password: passNew);
          if (credential.user == null) {
            toastLogin(msg: "User does not exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastLogin(msg: "You need to verify your email account");
            return;
          }
          /* var user = credential.user;
          if (user != null) {
            toastLogin(msg: "User exist");
            return;
          } else {
            toastLogin(msg: "No user");
            return;
          } */
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastLogin(msg: "No user found for that email");
            return;
          } else if (e.code == 'wrong-password') {
            toastLogin(msg: "Pasword is wrong");
            return;
          } else if (e.code == 'invalid-email') {
            toastLogin(msg: "your email format is invalid");
            return;
          }
        }
      }
    } catch (e) {}
    Global.storageService.setString(AppConstant.STORAGE_USER_TOKEY_KEY, "12345678");
     Navigator.of(context).pushNamedAndRemoveUntil("/counter", (route) => false);
  }
}
