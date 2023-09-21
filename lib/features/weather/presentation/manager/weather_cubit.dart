import 'package:bloc/bloc.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:meta/meta.dart';
import 'package:test_app/features/weather/domain/entities/weather_entity.dart';
import 'package:test_app/features/weather/domain/use_cases/get_geolocation_use_case.dart';
import 'package:test_app/features/weather/domain/use_cases/get_weather_use_case.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase _getWeatherUseCase;
  final GetGeolocationUseCase _getGeolocationUseCase;

  WeatherCubit(
    this._getWeatherUseCase,
    this._getGeolocationUseCase,
  ) : super(WeatherInitial());

  Future<void> getCurrentWeather() async {
    emit(WeatherLoading());

    try {
      final Position position = await _getGeolocationUseCase.getLocation();

      final WeatherEntity weather = await _getWeatherUseCase.getWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      emit(WeatherSuccess(weatherEntity: weather));
    } catch (e) {
      emit(WeatherFailure(error: e.toString()));
    }
  }
}
