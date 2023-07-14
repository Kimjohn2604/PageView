part of 'counter_bloc.dart';
class CounterState {
  int counter;
  CounterState({required this.counter});
}

class CounterInitial extends CounterState {
  CounterInitial({required super.counter});
}
