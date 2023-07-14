import 'package:bloc/bloc.dart';

part 'wellcom_event.dart';
part 'wellcom_state.dart';

class WellcomBloc extends Bloc<WellcomEvent, WellcomState> {
  WellcomBloc() : super(WellcomInitial(pageNumber: 0)) {
    on<WellcomEvent>((event, emit) {
      emit(WellcomState(pageNumber: state.pageNumber));
    });
  }
}
