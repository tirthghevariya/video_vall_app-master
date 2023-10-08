
import 'dart:convert';
import 'dart:developer';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_vall_app/Resources/Routes/routes_name.dart';
import 'package:video_vall_app/model/adId_moel.dart';
class FacebookAdController extends GetxController{

  bool isRewardedAdLoaded = false;

  // Interstitial Ad
  bool isInterstitialAdLoaded = false;
  RxString faceBookRewardAdPlacementID = "".obs;
  RxString faceBookInterstitialAdPlacementID = "".obs;
  RxString faceBookBannerAdPlacementID = "".obs;
  RxString faceBookNativeAdPlacementID = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFacebookId().then((value) {
      faceBookRewardAdPlacementID.value = value.message!.first.fbReward!;
      faceBookInterstitialAdPlacementID.value = value.message!.first.fbInter!;
      faceBookBannerAdPlacementID.value = value.message!.first.fbBanner!;
      faceBookNativeAdPlacementID.value = value.message!.first.fbNative!;

      log("================ ${faceBookBannerAdPlacementID.value}");
      FacebookAudienceNetwork.init(
        testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional// optional
        iOSAdvertiserTrackingEnabled: true,
      ).then((value) {
        loadFacebookInterstitialAd();
        // loadFacebookRewardedVideoAd();
      });
    });

    update();
  }
  Future<AdIdModel> fetchFacebookId() async {
    final response = await http
        .get(Uri.parse('https://mibhhsb.github.io/bwcgbhbswf/ads.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return AdIdModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  //////////// Facebook interstitial Ad ///////////

  void loadFacebookInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: faceBookInterstitialAdPlacementID.value,
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED) {
          isInterstitialAdLoaded = true;
        }

        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          isInterstitialAdLoaded = false;
          loadFacebookInterstitialAd();
        }
      },
    );
  }

  showFacebookInterstitialAd() {
    if (isInterstitialAdLoaded == true) {
      FacebookInterstitialAd.showInterstitialAd();
    } else {
      FacebookInterstitialAd.showInterstitialAd();
      print("Interstial Ad not yet loaded!");
    }
  }

  //////////// Facebook Reward Ad ///////////

/*  void loadFacebookRewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: faceBookRewardAdPlacementID,
      listener: (result, value) {

        print("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED) isRewardedAdLoaded = true;
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE && result == RewardedVideoAdResult.VIDEO_CLOSED &&
            (value == true || value["invalidated"] == true)) {
          isRewardedAdLoaded = false;

          loadFacebookRewardedVideoAd();
        }
      },
    );}

  showFacebookRewardedAd() {
    if (isRewardedAdLoaded == true) {
      FacebookRewardedVideoAd.showRewardedVideoAd();
    } else {
      print("Rewarded Ad not yet loaded!");
    }
  }*/
}