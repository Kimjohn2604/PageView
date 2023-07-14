import 'package:bloc/bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<UserEvent>((event, emit) {
      emit(state.copyWith(user: event.user));
    });
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<RePasswordEvent>((event, emit) {
      emit(state.copyWith(repassword: event.repassword));
    });
  }
}
