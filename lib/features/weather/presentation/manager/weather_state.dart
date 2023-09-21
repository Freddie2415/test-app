part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFailure extends WeatherState {
  final String error;

  WeatherFailure({required this.error});
}

class WeatherSuccess extends WeatherState {
  final WeatherEntity weatherEntity;

  WeatherSuccess({
    required this.weatherEntity,
  });
}
