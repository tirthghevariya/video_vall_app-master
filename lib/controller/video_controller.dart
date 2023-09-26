import 'package:get/get.dart';

import '../model/video_model.dart';
import '../repository/product_repo.dart';

class VideoController extends GetxController implements GetxService {
  VideoModel? videoModel;
  bool isLoading = false;
  final VideoList _videoList = VideoList();

  Future<void> getVideoList() async {
    isLoading = true;
    update();
    Response response = await _videoList.getProductList();
    if (response.statusCode == 200) {
      videoModel = VideoModel.fromJson(response.body);
      isLoading = false;
      update();
    } else {
      return;
    }
  }
}
