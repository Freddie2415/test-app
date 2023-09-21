import 'package:test_app/features/weather/domain/entities/weather_entity.dart';
import 'package:test_app/features/weather/domain/repositories/weather_repository_interface.dart';

class GetWeatherUseCase {
  final WeatherRepositoryInterface _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  Future<WeatherEntity> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    return _weatherRepository.getWeather(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
