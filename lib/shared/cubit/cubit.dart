import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit():super (AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark=false;
  //ThemeMode app=ThemeMode.dark;
  void changeAppMode({bool? fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark;
      cacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }

  }

}