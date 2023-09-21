import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/theme/presentation/manager/theme_cubit.dart';

class ThemeModeSwitcher extends StatelessWidget {
  const ThemeModeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return FloatingActionButton(
      heroTag: null,
      onPressed: themeCubit.changeThemeMode,
      child: const Icon(Icons.palette),
    );
  }
}
