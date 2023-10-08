// To parse this JSON data, do
//
//     final adIdModel = adIdModelFromJson(jsonString);

import 'dart:convert';

AdIdModel adIdModelFromJson(String str) => AdIdModel.fromJson(json.decode(str));

String adIdModelToJson(AdIdModel data) => json.encode(data.toJson());

class AdIdModel {
  List<Message>? message;

  AdIdModel({
    this.message,
  });

  factory AdIdModel.fromJson(Map<String, dynamic> json) => AdIdModel(
    message: json["message"] == null ? [] : List<Message>.from(json["message"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class Message {
  String? appName;
  String? packagename;
  String? admobBanner;
  String? admobBanner1;
  String? admobInter;
  String? admobInter1;
  String? admobReward;
  String? admobReward1;
  String? admobNative;
  String? admobNative1;
  String? admobIntervid;
  String? qurekaBanner;
  String? qurekaBanner1;
  String? qurekaInter;
  String? qurekaInter1;
  String? qurekaNative;
  String? qurekaNative1;
  String? fbBanner;
  String? fbBanner1;
  String? fbInter;
  String? fbInter1;
  String? fbNative;
  String? fbNative1;
  String? fbReward;
  String? fbReward1;
  String? fbIntervid;
  String? fbNativebanner;
  String? qurekaOnOff;
  String? console;
  String? privacyPolicy;
  String? bannerOtherappShow;
  String? linkOtherappPackageName;

  Message({
    this.appName,
    this.packagename,
    this.admobBanner,
    this.admobBanner1,
    this.admobInter,
    this.admobInter1,
    this.admobReward,
    this.admobReward1,
    this.admobNative,
    this.admobNative1,
    this.admobIntervid,
    this.qurekaBanner,
    this.qurekaBanner1,
    this.qurekaInter,
    this.qurekaInter1,
    this.qurekaNative,
    this.qurekaNative1,
    this.fbBanner,
    this.fbBanner1,
    this.fbInter,
    this.fbInter1,
    this.fbNative,
    this.fbNative1,
    this.fbReward,
    this.fbReward1,
    this.fbIntervid,
    this.fbNativebanner,
    this.qurekaOnOff,
    this.console,
    this.privacyPolicy,
    this.bannerOtherappShow,
    this.linkOtherappPackageName,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    appName: json["app_name"],
    packagename: json["packagename"],
    admobBanner: json["admob_banner"],
    admobBanner1: json["admob_banner1"],
    admobInter: json["admob_inter"],
    admobInter1: json["admob_inter1"],
    admobReward: json["admob_reward"],
    admobReward1: json["admob_reward1"],
    admobNative: json["admob_native"],
    admobNative1: json["admob_native1"],
    admobIntervid: json["admob_intervid"],
    qurekaBanner: json["qureka_banner"],
    qurekaBanner1: json["qureka_banner1"],
    qurekaInter: json["qureka_inter"],
    qurekaInter1: json["qureka_inter1"],
    qurekaNative: json["qureka_native"],
    qurekaNative1: json["qureka_native1"],
    fbBanner: json["fb_banner"],
    fbBanner1: json["fb_banner1"],
    fbInter: json["fb_inter"],
    fbInter1: json["fb_inter1"],
    fbNative: json["fb_native"],
    fbNative1: json["fb_native1"],
    fbReward: json["fb_reward"],
    fbReward1: json["fb_reward1"],
    fbIntervid: json["fb_intervid"],
    fbNativebanner: json["fb_nativebanner"],
    qurekaOnOff: json["qureka_on off"],
    console: json["console"],
    privacyPolicy: json["privacy_policy"],
    bannerOtherappShow: json["banner_otherapp_show"],
    linkOtherappPackageName: json["link_otherapp_package_name"],
  );

  Map<String, dynamic> toJson() => {
    "app_name": appName,
    "packagename": packagename,
    "admob_banner": admobBanner,
    "admob_banner1": admobBanner1,
    "admob_inter": admobInter,
    "admob_inter1": admobInter1,
    "admob_reward": admobReward,
    "admob_reward1": admobReward1,
    "admob_native": admobNative,
    "admob_native1": admobNative1,
    "admob_intervid": admobIntervid,
    "qureka_banner": qurekaBanner,
    "qureka_banner1": qurekaBanner1,
    "qureka_inter": qurekaInter,
    "qureka_inter1": qurekaInter1,
    "qureka_native": qurekaNative,
    "qureka_native1": qurekaNative1,
    "fb_banner": fbBanner,
    "fb_banner1": fbBanner1,
    "fb_inter": fbInter,
    "fb_inter1": fbInter1,
    "fb_native": fbNative,
    "fb_native1": fbNative1,
    "fb_reward": fbReward,
    "fb_reward1": fbReward1,
    "fb_intervid": fbIntervid,
    "fb_nativebanner": fbNativebanner,
    "qureka_on off": qurekaOnOff,
    "console": console,
    "privacy_policy": privacyPolicy,
    "banner_otherapp_show": bannerOtherappShow,
    "link_otherapp_package_name": linkOtherappPackageName,
  };
}
