import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  int _incrementValue = 1;
  final _minCounterValue = 0;
  final _maxCounterValue = 10;

  void setIncrementValue(int value) {
    _incrementValue = value;
  }

  void increment() {
    int counterValue = _validateCounterMinMax(state + _incrementValue);
    emit(counterValue);
  }

  void decrement() {
    int counterValue = _validateCounterMinMax(state - _incrementValue);
    emit(counterValue);
  }

  int _validateCounterMinMax(int counter) {
    if (counter > _maxCounterValue) {
      return _maxCounterValue;
    }

    if (counter < _minCounterValue) {
      return _minCounterValue;
    }

    return counter;
  }
}
