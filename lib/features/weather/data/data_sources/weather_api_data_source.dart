import 'package:test_app/core/datasources/api_provider.dart';
import 'package:test_app/features/weather/data/models/weather_model.dart';

class WeatherApiDataSource extends ApiProvider {
  final String apiKey;

  WeatherApiDataSource(super.dio, super.baseUrl, {required this.apiKey});

  Future<WeatherModel> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final json = await get(
      "$baseUrl/data/2.5/weather",
      queryParams: {
        "lat": latitude,
        "lon": longitude,
        "appid": apiKey,
      },
    );
    return WeatherModel.fromJson(json);
  }
}
