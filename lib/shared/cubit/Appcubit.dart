import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/network/local/cache_helper.dart';

import 'AppStates.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialStates());

  static AppCubit get(context)=>BlocProvider.of(context);

  bool isDark=false;

  void changeAppMode({bool?fromShared}){
    if(fromShared != null){
      isDark=fromShared;
      emit(AppChangeModeState());
    }
    else {
      isDark = !isDark;
      CacheHelper.putBoolData(key: "isDark", value: isDark).
      then((value) {
        emit(AppChangeModeState());
      });
    }
  }}