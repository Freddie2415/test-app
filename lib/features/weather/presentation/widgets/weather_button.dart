import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/weather/presentation/manager/weather_cubit.dart';

class WeatherButton extends StatelessWidget {
  const WeatherButton({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = BlocProvider.of<WeatherCubit>(context);
    return FloatingActionButton(
      heroTag: null,
      onPressed: weatherCubit.getCurrentWeather,
      child: const Icon(Icons.cloud),
    );
  }
}
