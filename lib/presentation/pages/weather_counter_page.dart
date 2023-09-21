import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/counter/presentation/manager/counter_cubit.dart';
import 'package:test_app/features/counter/presentation/widgets/counter_widget.dart';
import 'package:test_app/features/theme/presentation/widgets/theme_mode_switcher.dart';
import 'package:test_app/features/weather/presentation/manager/weather_cubit.dart';
import 'package:test_app/features/weather/presentation/widgets/weather_button.dart';

class WeatherCounterPage extends StatelessWidget {
  const WeatherCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Counter"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (_, state) {
                      if (state is WeatherInitial) {
                        return const Text(
                          "Press the icon to get your location",
                          textAlign: TextAlign.center,
                        );
                      }

                      if (state is WeatherSuccess) {
                        return Text(
                          state.weatherEntity.info,
                          textAlign: TextAlign.center,
                        );
                      }

                      if (state is WeatherFailure) {
                        return Text(
                          state.error,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'You have pushed the button this many times:',
                    textAlign: TextAlign.center,
                  ),
                  BlocBuilder<CounterCubit, int>(
                    builder: (context, counter) {
                      return Text(
                        '$counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                children: [
                  WeatherButton(),
                  SizedBox(height: 20),
                  ThemeModeSwitcher(),
                ],
              ),
            ),
            const Positioned(
              bottom: 20,
              right: 20,
              child: CounterControl(),
            ),
          ],
        ),
      ),
    );
  }
}
