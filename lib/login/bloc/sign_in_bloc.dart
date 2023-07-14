import 'package:bloc/bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState(showpass: true)) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    /* on<EmailEvent>(_emailEvent); */
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<ShowPasswordEvent>((event, emit) {
      emit(state.copyWith(showpass: !state.showpass));
    });
  }
 /*  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  } */
}
