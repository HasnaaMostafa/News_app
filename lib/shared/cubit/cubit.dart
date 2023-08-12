import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/modules/sports/sportsScreen.dart';
import 'package:newss_app/shared/cubit/states.dart';
import '../../modules/business/businessScreen.dart';
import '../../modules/science/scienceScreen.dart';
import '../../modules/setting_screens/setting_screen.dart';
import '../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialStates());
  static NewsCubit get(context)=> BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem> bottomItems= const[
    BottomNavigationBarItem(icon:
     Icon(
         Icons.business),
     label: "Business"),
    BottomNavigationBarItem(icon:
    Icon(
        Icons.sports),
        label: "Sports"),
    BottomNavigationBarItem(icon:
    Icon(
        Icons.science),
        label: "Science"),
  ];

  List<Widget> screens= const[
    BusinessScreen(),
    SportsScreen(),
    SciencesScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex=index;
    // if(index==1){
    //   getSports();
    // }
    emit(NewsBottomNavState());
  }

  List<dynamic> business=[];
  // List<bool> businessSelectedItem=[];

  int selectedBusinessItem=0;

  bool isDesktop=false;


  void setDesktop(bool value){
    isDesktop=value;
    emit(NewsSetDesktopState());
  }

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: "v4/top-headlines",
        query: {
          "country":"eg",
          "category":"business",
          "apikey" :"691fbd8a4974921410252d42388d55ae",
        }).then((value){
      // debugPrint(value.data["articles"][0]["title"].toString());
      business = value.data["articles"];
      // business.forEach((element) {
      //   businessSelectedItem.add(false);
      // });
      // debugPrint((business[0]["title"]));

      emit(NewsGetBusinessSuccessState());

    }).catchError((error){
      debugPrint((error.toString()));

      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void selectBusinessItem(index){

    // for (int i = 0 ; i < businessSelectedItem.length; i++){
    //   if(i==index) {
    //     businessSelectedItem[i]=true;
    //   }
    //   else {
    //     businessSelectedItem[i]=false;
    //   }
    // }
    selectedBusinessItem=index;


    emit(NewsSelectBusinessItemState());

  }

  List<dynamic> sports=[];
  void getSports(){
    emit(NewsGetSportsLoadingState());
      DioHelper.getData(
          url: "v4/top-headlines",
          query: {
            "country":"eg",
            "category":"sports",
            "apikey" :"691fbd8a4974921410252d42388d55ae"
          }).then((value) {
        sports=value.data["articles"];
        emit(NewsGetSportsSuccessState());

      }).catchError((error){
        // debugPrint(error.toString());

        emit(NewsGetSportsErrorState(error.toString()));
      });

  }

  List<dynamic> science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        url: "v4/top-headlines",
        query: {
          "country":"eg",
          "category":"science",
          "apikey" :"691fbd8a4974921410252d42388d55ae",
        }
    ).then((value) {
      science=value.data["articles"];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      // debugPrint(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search=[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    search=[];
    DioHelper.getData(
        url: "v4/search",
        query: {
          "q" : value,
          "apikey" :"691fbd8a4974921410252d42388d55ae",
        }).then((value){
          search=value.data["articles"];
          emit(NewsGetSearchSuccessState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(NewsGetSearchErrorState(error));
    });
  }


}
// class AppCubit extends Cubit<AppStates>{
//
//   AppCubit() : super(AppInitialStates());
//
//   static AppCubit get(context)=>BlocProvider.of(context);
//
//   bool isDark=false;
//
//   void changeAppMode(){
//     isDark =! isDark;
//     emit(AppChangeModeState());
//   }
