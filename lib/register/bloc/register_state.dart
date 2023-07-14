part of 'register_bloc.dart';

class RegisterState {
  final String user;
  final String email;
  final String password;
  final String repassword;

  RegisterState(
      {this.user = "",
      this.email = "",
      this.password = "",
      this.repassword = ""});
  RegisterState copyWith({
    String? user,
    String? email,
    String? password,
    String? repassword,
  }) {
    return RegisterState(
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      repassword: repassword ?? this.repassword,
    );
  }
}
