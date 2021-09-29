import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/ranking/interface.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

class WordsLearned extends StatelessWidget {
  int x;
  AutoSizeGroup group ;


  WordsLearned(this.x , this.group);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: SizeConfig.screenHeight > 500
          ? 130
          : 120,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 5,
            vertical: SizeConfig.blockSizeHorizontal * 2),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(
                    SizeConfig.blockSizeHorizontal * 5,
                    SizeConfig.blockSizeHorizontal * 2,
                    SizeConfig.blockSizeHorizontal * 5,
                    0),
                child: ListTile(
                  leading: Image.asset(ImageStrings.profileBookAsset),
                  title: AutoSizeText(
                    "You learned $x words!!!",
                    maxLines: 2,
                    minFontSize: 10,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    group: group,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 5,
                      vertical: SizeConfig.blockSizeHorizontal * 2),
                  width: SizeConfig.blockSizeHorizontal * 85,
                  child: CustomContainer(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 5,
                        vertical: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      child: AutoSizeText(
                        "REVIEW WORDS!",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        minFontSize: 10,
                      ),
                    ),
                    onPressed: () => Get.to(Interface(false)),
                    outerColor: Colors.green,
                    innerColor: Colors.lightGreen,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
