abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}
class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
   final String error;

  NewsGetBusinessErrorState(this.error);}

class NewsGetBusinessLoadingState extends NewsStates{}


class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}

// abstract class AppStates{}
// class AppInitialStates extends AppStates{}
//
// class AppChangeModeState extends AppStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}



//window

class NewsSelectBusinessItemState extends NewsStates{}

class NewsSetDesktopState extends NewsStates{}






