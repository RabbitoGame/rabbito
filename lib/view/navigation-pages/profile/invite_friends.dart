import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriends extends StatelessWidget {
  AutoSizeGroup group;

  InviteFriends(this.group);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: SizeConfig.screenHeight > 400
          ? 130
          : SizeConfig.screenHeight > 320
              ? SizeConfig.blockSizeVertical * 35
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
                  leading: Image.asset(ImageStrings.profileGiftAsset),
                  title: AutoSizeText(
                    "invite-gift".tr,
                    maxLines: 2,
                    minFontSize: 12,
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
                        "invite-friends".tr,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        minFontSize: 10,
                      ),
                    ),
                    onPressed: () {
                      return Share.share(
                        "Hi my Friend!\n i found this cole game for learning" +
                            " every language with playing card games!" +
                            ",use this code to get bonus\n" +
                            "1241435252\n" +
                            "site info:",
                        subject: "hey where are you???",
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
