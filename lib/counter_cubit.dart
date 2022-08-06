import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  int number = 2;

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void reset() {
    emit(0);
  }

  // void multiplication() {
  //   emit(state * number);
  // }

  // void division() {
  //   emit(state % number);
  // }
}
