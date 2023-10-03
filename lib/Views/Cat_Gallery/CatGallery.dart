import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_vall_app/Resources/app_style.dart';
import 'package:video_vall_app/helper/facebook_admanager.dart';

import '../../Resources/Routes/routes_name.dart';

class CategoryGallery extends StatefulWidget {
  const CategoryGallery({Key? key}) : super(key: key);

  @override
  State<CategoryGallery> createState() => _CategoryGalleryState();
}

class _CategoryGalleryState extends State<CategoryGallery> {

  FacebookAdController facebookAdController = Get.put(FacebookAdController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        leading: BackButton(color: Styles.appBarWhite,onPressed: () {
          facebookAdController.showFacebookInterstitialAd();
          Get.back();
        },),
        leadingWidth: 5.w,
        title: Text(
          "Live Video Call",
          style: Styles.appBarStyle,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Global Video Call",
                textAlign: TextAlign.center,
                style: Styles.appBarStyle.copyWith(fontSize: 22.sp),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Select Call Type?',
                  style: Styles.findExactSame
                      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),

          FacebookBannerAd(
            bannerSize: BannerSize.STANDARD,
            keepAlive: true,
            placementId: bannerPlacementId,
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 1 / 1.40,
              crossAxisCount: 2,
              crossAxisSpacing: 5.w,
              mainAxisSpacing: 5.w,
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  left: 2.w,
                  right: 2.w,
                  bottom: 5.h), // Number of columns in the grid
              children: <Widget>[
                // List of items in the grid
                const MyGridItem('Live Video Call', image: 'assets/cat_image/1.jpg'),
                const MyGridItem('Random Call', image: 'assets/cat_image/2.jpg'),
                const MyGridItem('Global video Call',
                    image: 'assets/cat_image/3.jpg'),
                const MyGridItem('Stranger Call', image: 'assets/cat_image/4.jpg'),
                const MyGridItem('Live Girls', image: 'assets/cat_image/5.jpg'),
                const MyGridItem('Instant Call', image: 'assets/cat_image/6.jpg'),
                const MyGridItem('Only Girls', image: 'assets/cat_image/7.jpg'),
                const MyGridItem('Out of our Country Call',
                    image: 'assets/cat_image/8.jpg'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyGridItem extends StatelessWidget {
  final String text;
  final String image;

  const MyGridItem(this.text, {super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesName.matchCall);
      },
      child: Stack(
        children: [
          Container(
            height: 80.h, // Increase the height as desired
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w),
              border: Border.all(
                color: Styles.primaryColor,
                width: 2.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.w),
              child: Stack(
                children: [
                  Image(
                    height: 100.h,
                    width: 100.w,
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.w),
                ),
                gradient: LinearGradient(colors: [
                  Styles.primaryColor.withOpacity(.60),
                  Colors.transparent,
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          Positioned(
            bottom: 2.h,
            right: 0,
            left: 0,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Styles.appBarStyle,
            ),
          ),
        ],
      ),
    );
  }
}
