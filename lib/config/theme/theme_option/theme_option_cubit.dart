import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/core/dependencies/shared_pref.dart';
import 'package:rmo_food/core/enums.dart';

class ThemeOptionCubit extends Cubit<ThemeOption> {
  ThemeOptionCubit() : super(ThemeOption.system);

  updateOption(ThemeOption option) {
    emit(option);
    _saveOption(option.name);
  }

  getSavedOption() async {
    String savedOption = SharedPref.getThemeOption;

    switch (savedOption) {
      case "light":
        emit(ThemeOption.light);
        break;
      case "dark":
        emit(ThemeOption.dark);
        break;
      case "system":
        emit(ThemeOption.system);
        break;
      default:
        emit(ThemeOption.system);
    }
  }

  _saveOption(String value) => SharedPref.setThemeOption(value);
}
