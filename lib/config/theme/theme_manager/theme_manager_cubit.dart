import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeManagerCubit extends Cubit<ThemeMode> {
  ThemeManagerCubit() : super(ThemeMode.system);

  updateTheme(ThemeMode theme) => emit(theme);
}
