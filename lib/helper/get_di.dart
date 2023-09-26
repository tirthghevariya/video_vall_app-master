import 'package:get/get.dart';
import 'package:video_vall_app/controller/video_controller.dart';

Future init() async {
  Get.lazyPut(() => VideoController());
}
