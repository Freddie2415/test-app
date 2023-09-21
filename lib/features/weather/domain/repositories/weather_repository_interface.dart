import 'package:test_app/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepositoryInterface {
  Future<WeatherEntity> getWeather({
    required double latitude,
    required double longitude,
  });
}
