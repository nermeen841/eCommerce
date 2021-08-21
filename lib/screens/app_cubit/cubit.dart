import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/CacheHelper/mySharedPreference.dart';
import 'package:shop_app/screens/app_cubit/appState.dart';

class AppCubit extends Cubit<AppcubitStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppThememode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.saveAppMode(isDark);
      emit(ChangeAppThemeState());
    }
  }

  int counter = 1;

  void increaseQuantity() {
    counter++;
    emit(IncreaseCounterState());
  }

  void decreaseQuantity() {
    counter--;
    if (counter < 1) counter = 1;
    emit(DecreaseCounterState());
  }
}
