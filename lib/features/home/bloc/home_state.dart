 
import 'package:date_app_team/features/home/data/model/home_model.dart';

class HomePageStates {}

class HomeInitState extends HomePageStates {}

class HomeLoadingState extends HomePageStates {}

class HomeErrorState extends HomePageStates {
  String error;
  HomeErrorState(this.error);
}

class HomeCompleteState extends HomePageStates {
  HomeModel homeData;
  HomeCompleteState(this.homeData);
}
