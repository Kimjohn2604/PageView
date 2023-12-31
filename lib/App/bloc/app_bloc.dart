import 'package:bloc/bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<TriggleAppEvent>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}
