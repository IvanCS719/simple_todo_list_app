import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo_list_app/config/theme/app_theme.dart';

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier(): super(AppTheme());

  void toggleTheme(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);