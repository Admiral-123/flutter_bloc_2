part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

// class CounterSnackbarEvent extends CounterEvent {}

class CounterShowSnackbarActionEvent extends CounterEvent {}

class CounterIncrementActionEvent extends CounterEvent {}
