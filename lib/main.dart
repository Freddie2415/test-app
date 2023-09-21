import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/service_locator.dart';
import 'package:test_app/features/counter/presentation/manager/counter_cubit.dart';
import 'package:test_app/features/theme/presentation/manager/theme_cubit.dart';
import 'package:test_app/features/weather/presentation/manager/weather_cubit.dart';
import 'package:test_app/presentation/application.dart';

void main() {
  setupServiceLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<CounterCubit>()),
        BlocProvider(create: (_) => getIt.get<ThemeCubit>()),
        BlocProvider(create: (_) => getIt.get<WeatherCubit>()),
      ],
      child: const Application(),
    ),
  );
}
