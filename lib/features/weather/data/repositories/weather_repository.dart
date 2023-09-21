import 'package:test_app/core/mappers/mapper.dart';
import 'package:test_app/features/weather/data/data_sources/weather_api_data_source.dart';
import 'package:test_app/features/weather/data/models/weather_model.dart';
import 'package:test_app/features/weather/domain/entities/weather_entity.dart';
import 'package:test_app/features/weather/domain/repositories/weather_repository_interface.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  final WeatherApiDataSource _weatherApiDataSource;
  final Mapper<WeatherEntity, WeatherModel> weatherMapper;

  WeatherRepository(this._weatherApiDataSource, this.weatherMapper);

  @override
  Future<WeatherEntity> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final weatherModel = await _weatherApiDataSource.getWeather(
      latitude: latitude,
      longitude: longitude,
    );
    return weatherMapper.toEntity(weatherModel);
  }
}
