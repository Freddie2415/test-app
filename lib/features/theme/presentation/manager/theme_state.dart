part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isDark;

  ThemeData get theme => isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  const ThemeState({
    required this.isDark,
  });

  ThemeState copyWith({required bool isDark}) {
    return ThemeState(isDark: isDark);
  }

  @override
  List<Object?> get props => [isDark];

  /// начало анимации смены темы начинается с этой позиции
  Offset getOffset(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Offset(50, size.height - 90);
  }
}
