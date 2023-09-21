import 'package:test_app/core/mappers/mapper.dart';
import 'package:test_app/features/weather/data/models/weather_model.dart';
import 'package:test_app/features/weather/domain/entities/weather_entity.dart';

class WeatherMapper implements Mapper<WeatherEntity, WeatherModel> {
  @override
  WeatherEntity toEntity(WeatherModel weatherModel) {
    double temperatureCelsius = (weatherModel.main.temp - 273.15);
    double feelsLikeCelsius = (weatherModel.main.feelsLike - 273.15);

    final String info = '''
      In the city of ${weatherModel.name} (${weatherModel.coord.lat}°N, ${weatherModel.coord.lon}°E), it is currently ${weatherModel.weather[0].description}. Temperature: ${temperatureCelsius.toStringAsFixed(2)}°C. Feels like: ${feelsLikeCelsius.toStringAsFixed(2)}°C. Humidity: ${weatherModel.main.humidity}%. Wind: ${weatherModel.wind.speed} m/s. Cloudiness: ${weatherModel.clouds.all}%.
    ''';

    return WeatherEntity(info: info);
  }

  @override
  WeatherModel toModel(WeatherEntity entity) {
    // TODO: implement toModel
    throw UnimplementedError();
  }
}
