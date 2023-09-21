import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/constants.dart';
import 'package:test_app/features/counter/presentation/manager/counter_cubit.dart';
import 'package:test_app/features/theme/presentation/manager/theme_cubit.dart';
import 'package:test_app/features/weather/data/data_sources/weather_api_data_source.dart';
import 'package:test_app/features/weather/data/mappers/weather_mapper.dart';
import 'package:test_app/features/weather/data/repositories/weather_repository.dart';
import 'package:test_app/features/weather/domain/use_cases/get_geolocation_use_case.dart';
import 'package:test_app/features/weather/domain/use_cases/get_weather_use_case.dart';
import 'package:test_app/features/weather/presentation/manager/weather_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() async {
  final dio = Dio();

  /// mappers
  getIt.registerFactory(() => WeatherMapper());

  /// data sources
  getIt.registerFactory(
    () => WeatherApiDataSource(
      dio,
      openWeatherMapApiURL,
      apiKey: openWeatherAPIKEY,
    ),
  );

  /// register repositories
  getIt.registerFactory(
    () => WeatherRepository(
      getIt.get<WeatherApiDataSource>(),
      getIt.get<WeatherMapper>(),
    ),
  );

  /// register use cases
  getIt.registerFactory(() => GetGeolocationUseCase());
  getIt.registerFactory(
    () => GetWeatherUseCase(
      getIt.get<WeatherRepository>(),
    ),
  );

  /// register state managers
  getIt.registerFactory(() => ThemeCubit());
  getIt.registerFactory(() => CounterCubit());
  getIt.registerFactory(
    () => WeatherCubit(
      getIt.get<GetWeatherUseCase>(),
      getIt.get<GetGeolocationUseCase>(),
    ),
  );
}
