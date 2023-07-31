part of 'app_bloc.dart';


abstract class AppEvent {}

class TriggleAppEvent extends AppEvent{
  final int index;
  TriggleAppEvent(this.index);
}
