import 'package:get/get.dart';

import '../data/api_data.dart';
import '../utils/app_constant.dart';

class VideoList {
  ApiClient apiClient = ApiClient();
  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstant.videoList);
  }
}
