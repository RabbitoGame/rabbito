import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';

class FutureAppBar extends StatelessWidget {
  final FutureAppBarController _controller = Get.put(FutureAppBarController());

  @override
  Widget build(BuildContext context) {
    double width = 33;
    return Container(
      height: 60.0,
      color: Colors.purple,
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 4.0, 10.0),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image(
              image: AssetImage(ImageStrings.appbarFlagAsset),
              width: 45,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage(ImageStrings.appbarCoinAsset),
                  width: width,
                ),
                Container(
                  child: Center(
                    child: Obx(() {
                      return Text(
                        _controller.coin.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontFamily: 'Railway',
                          fontSize: 16.0,
                        ),
                      );
                    }),
                  ),
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(
                    ImageStrings.rankingCarrotAsset,
                  ),
                  width: 30,
                ),
                Container(
                  child: Center(
                    child: Obx(() {
                      return Text(
                        _controller.carrot.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontFamily: 'Railway',
                          fontSize: 16.0,
                        ),
                      );
                    }),
                  ),
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                )
              ],
            ),
            Row(
              children: [
                Image(
                  image: AssetImage(ImageStrings.appbarHeartAsset),
                  width: width,
                ),
                Container(
                  child: Center(
                    child: Obx(() {
                      return Text(
                        _controller.heart.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontFamily: 'Railway',
                          fontSize: 16.0,
                        ),
                      );
                    }),
                  ),
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                )
              ],
            ),
          ])),
    );
  }
}

class FutureAppBarController extends GetxController {
  RxString _coin = UserStrings.emptyInfo.obs;
  RxString _heart = UserStrings.emptyInfo.obs;
  RxString _carrot = UserStrings.emptyInfo.obs;

  RxString get coin => _coin;

  set coin(RxString value) {
    _coin = value;
  }

  RxString get heart => _heart;

  set heart(RxString value) {
    _heart = value;
  }

  RxString get carrot => _carrot;

  set carrot(RxString value) {
    _carrot = value;
  }
}
