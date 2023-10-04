
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:get/get.dart';
import 'package:video_vall_app/Resources/Routes/routes_name.dart';
String bannerPlacementId = "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047";
class FacebookAdController extends GetxController{

  bool isRewardedAdLoaded = false;

  // Interstitial Ad
  bool isInterstitialAdLoaded = false;
  static const String faceBookRewardAdPlacementID = "VID_HD_16_9_15S_LINK#YOUR_PLACEMENT_ID";
  static const String faceBookInterstitialAdPlacementID = "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FacebookAudienceNetwork.init(
      testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional// optional
      iOSAdvertiserTrackingEnabled: true,
    ).then((value) {
      loadFacebookInterstitialAd();
      // loadFacebookRewardedVideoAd();
    });
  }

  //////////// Facebook interstitial Ad ///////////

  void loadFacebookInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: faceBookInterstitialAdPlacementID,
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