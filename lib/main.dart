import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_vall_app/Resources/Routes/routes.dart';
import 'Resources/Routes/routes_name.dart';
import 'package:video_vall_app/helper/get_di.dart' as di;

void main() async {
  runApp(const MyApp());
  await di.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xff161921),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: RoutesName.splashScreen,
            getPages: AppRoutes.appRoutes());
      },
    );
  }
}
