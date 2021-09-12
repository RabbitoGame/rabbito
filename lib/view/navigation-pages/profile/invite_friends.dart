import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as Path;

class InviteFriends extends StatelessWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RenderObject? box = context.findRenderObject();
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: ListTile(
              leading: Image.asset(ImageStrings.profileGiftAsset),
              title: Text("invite-gift".tr),
              subtitle: Text("invite-gift-message".tr),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            width: double.infinity,
            child: CustomContainer(
                child: Text(
                  "invite-friends".tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                // onPressed: ()=> Share.share('check out my website https://example.com',subject: "please join me!")
                onPressed: ()  {
                  // Directory tempDir = await getTemporaryDirectory();
                  // String tempPath = tempDir.path;
                  //
                  // Directory appDocDir =
                  //     await getApplicationDocumentsDirectory();
                  // String appDocPath = appDocDir.path;
                  // print("temp: $tempPath");
                  // print("app: $appDocPath");
                  return Share.share(
                    "Hi my Friend!\n i found this cole game for learning" +
                        " every language with playing card games!" +
                        ",use this code to get bonus\n" +
                        "1241435252\n"+"site info:",
                    subject: "hey where are you???",

                  );
                }),
          )
        ],
      ),
    );
  }
}
