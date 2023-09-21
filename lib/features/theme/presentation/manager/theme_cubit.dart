import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_app/presentation/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDark: false));

  void changeThemeMode() {
    bool isDarkMode = !state.isDark;
    emit(state.copyWith(isDark: isDarkMode));
  }
}
