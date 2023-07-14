part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}
class UserEvent extends RegisterEvent{
  final String user;
  UserEvent(this.user);
}
class EmailEvent extends RegisterEvent{
  final String email;
  EmailEvent(this.email);
}
class PasswordEvent extends RegisterEvent{
  final String password;
  PasswordEvent(this.password);
}
class RePasswordEvent extends RegisterEvent{
  final String repassword;
  RePasswordEvent(this.repassword);
}
