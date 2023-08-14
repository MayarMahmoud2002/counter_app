part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}
class ChangeCounterValueState extends CounterState
{
  final int counter ;

  ChangeCounterValueState(this.counter);
}