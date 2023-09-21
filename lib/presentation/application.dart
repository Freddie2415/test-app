import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/counter/presentation/manager/counter_cubit.dart';
import 'package:test_app/features/theme/presentation/manager/theme_cubit.dart';
import 'package:test_app/features/theme/presentation/widgets/theme_mode_transition.dart';
import 'package:test_app/presentation/pages/weather_counter_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: _themeStateListener,
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Weather Counter',
          theme: themeState.theme,
          home: ThemeModeTransition(
            isDark: themeState.isDark,
            offset: themeState.getOffset(context),
            childBuilder: (context, _) {
              return const WeatherCounterPage();
            },
          ),
        );
      },
    );
  }

  void _themeStateListener(BuildContext context, ThemeState state) {
    final incrementValue = state.isDark ? 2 : 1;
    BlocProvider.of<CounterCubit>(context).setIncrementValue(incrementValue);
  }
}
