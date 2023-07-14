part of 'sign_in_bloc.dart';

class SignInState {
  final String email;
  final String password;
  final bool showpass ;

  SignInState({this.email = "", this.password = "", this.showpass =true});
  SignInState copyWith({String? email, String? password, bool? showpass}) {
    return SignInState(
      email: email ?? this.email,
      password: password??this.password, 
      showpass: showpass??this.showpass
      );
  }
}
