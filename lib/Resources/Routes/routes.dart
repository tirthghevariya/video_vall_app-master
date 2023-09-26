// ignore_for_file: prefer_const_constructors

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:video_vall_app/Resources/Routes/routes_name.dart';
import 'package:video_vall_app/Views/Gender_Screen/gender_selection_view.dart';
import 'package:video_vall_app/Views/HomePage.dart';
import 'package:video_vall_app/Views/Splash/SplashScreen.dart';

import '../../Views/Cat_Gallery/CatGallery.dart';
import '../../Views/Match_Call/match_call_screen.dart';
import '../../Views/video_call_screen/all_video_screen.dart';
import '../Transitions/transition.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => SplashScreen(),
            transition: AppTransition.transition,
            transitionDuration: AppTransition.duration),
        GetPage(
            name: RoutesName.splashScreen2,
            page: () => SplashScreen2(),
            transition: AppTransition.transition,
            transitionDuration: AppTransition.duration),
        GetPage(
            name: RoutesName.genderSelection,
            page: () => GenderSelection(),
            transition: AppTransition.transition,
            transitionDuration: AppTransition.duration),
        GetPage(
            name: RoutesName.catGallery,
            page: () => CategoryGallery(),
            transition: AppTransition.transition,
            transitionDuration: AppTransition.duration),
        GetPage(
            name: RoutesName.matchCall,
            page: () => MatchCallScreen(),
            transition: AppTransition.transition,
            transitionDuration: AppTransition.duration),
        GetPage(
            name: RoutesName.videoCallScreen,
            page: () => VideoCallScreen(),
            transition: AppTransition.transition,
            transitionDuration: AppTransition.duration),
      ];
}
