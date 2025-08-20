import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_bloc/data/db/shared-preferences.dart';

enum AppThemeMode { system, light, dark }

// Events
abstract class ThemeEvent {}

class ThemeModeChanged extends ThemeEvent {
  final AppThemeMode themeMode;
  ThemeModeChanged(this.themeMode);
}

class ThemeToggled extends ThemeEvent {}

class ThemeLoaded extends ThemeEvent {}

// States
abstract class ThemeState {
  final AppThemeMode themeMode;
  const ThemeState({required this.themeMode});
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(themeMode: AppThemeMode.system);
}

class ThemeLoadedState extends ThemeState {
  const ThemeLoadedState({required super.themeMode});
}

// BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ThemeModeChanged>(_onThemeModeChanged);
    on<ThemeToggled>(_onThemeToggled);
    on<ThemeLoaded>(_onThemeLoaded);
  }

  Future<void> _onThemeLoaded(
    ThemeLoaded event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final themeModeIndex = await LocalDb.getThemeMode;
      if (themeModeIndex != null &&
          themeModeIndex < AppThemeMode.values.length) {
        emit(ThemeLoadedState(themeMode: AppThemeMode.values[themeModeIndex]));
      } else {
        emit(const ThemeLoadedState(themeMode: AppThemeMode.system));
      }
    } catch (e) {
      emit(const ThemeLoadedState(themeMode: AppThemeMode.system));
    }
  }

  Future<void> _onThemeModeChanged(
    ThemeModeChanged event,
    Emitter<ThemeState> emit,
  ) async {
    if (state.themeMode != event.themeMode) {
      emit(ThemeLoadedState(themeMode: event.themeMode));
      _storeThemeMode(event.themeMode.index);
    }
  }

  Future<void> _onThemeToggled(
    ThemeToggled event,
    Emitter<ThemeState> emit,
  ) async {
    AppThemeMode newThemeMode;

    if (state.themeMode == AppThemeMode.light) {
      newThemeMode = AppThemeMode.dark;
    } else if (state.themeMode == AppThemeMode.dark) {
      newThemeMode = AppThemeMode.light;
    } else {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      if (brightness == Brightness.light) {
        newThemeMode = AppThemeMode.dark;
      } else {
        newThemeMode = AppThemeMode.light;
      }
    }

    emit(ThemeLoadedState(themeMode: newThemeMode));
    await _storeThemeMode(newThemeMode.index);
  }

  Future<void> _storeThemeMode(int index) async {
    try {
      await LocalDb.storeThemeMode(index);
    } catch (e) {
      debugPrint('Failed to store theme mode: $e');
    }
  }

  bool get isDarkMode {
    if (state.themeMode == AppThemeMode.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    }
    return state.themeMode == AppThemeMode.dark;
  }

  AppThemeMode get currentThemeMode => state.themeMode;
}
