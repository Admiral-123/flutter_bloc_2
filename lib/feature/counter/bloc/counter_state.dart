part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

abstract class CounterActionState extends CounterState {}

class CounterIncrementState extends CounterState {
  final int val;

  CounterIncrementState({required this.val});
}

class CounterShowSnackbarActionSate extends CounterActionState {}

class CounterIncrementActionState extends CounterActionState {}
