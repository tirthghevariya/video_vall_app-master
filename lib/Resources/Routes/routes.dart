// ignore_for_file: prefer_const_constructors

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:video_vall_app/Resources/Routes/routes_name.dart';
import 'package:video_vall_app/Views/Gender_Screen/gender_selection_view.dart';
import 'package:video_vall_app/Views/HomePage.dart';
import 'package:video_vall_app/Views/Splash/SplashScreen.dart';

import '../../Views/Cat_Gallery/CatGallery.dart';
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
            name: RoutesName.GenderSelection,
            page: () => GenderSelection(),
            transition: AppTransition.transition,
            transitionDuration: AppTransition.duration),
        GetPage(
            name: RoutesName.catGallery,
            page: () => CategoryGallery(),
            transition: AppTransition.transition,
            transitionDuration: AppTransition.duration),
      ];
}
