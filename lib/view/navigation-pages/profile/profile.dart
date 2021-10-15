import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/model/user.dart';
import 'package:rabbito/view/navigation-pages/profile/achievements.dart';
import 'package:rabbito/view/navigation-pages/profile/friends_tabbar.dart';
import 'package:rabbito/view/navigation-pages/profile/invite_friends.dart';
import 'package:rabbito/view/navigation-pages/profile/user_statistics.dart';
import 'package:rabbito/view/navigation-pages/profile/words_learned.dart';

Widget profileMenu(BuildContext context) {
  return ProfileUI2();
}

class ProfileUI2 extends StatelessWidget {
  ProfileController _controller = Get.put(ProfileController());
  AutoSizeGroup _group = AutoSizeGroup();
  var height = SizeConfig.blockSizeVertical;

  @override
  Widget build(BuildContext context) {
    AutoSizeGroup group = AutoSizeGroup();
    return Container(
      color: Colors.white,
      child: Container(
        color: Colors.tealAccent.withOpacity(0.2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: Container(
                  width: double.infinity,
                  height: height * 22,
                  child: Container(
                    // alignment: Alignment(0.0, 5),
                    alignment: Alignment(0, 10),
                    child: CircleAvatar(
                      child: Image.asset(ImageStrings.logoAsset,
                          width: height * 20),
                      radius: height * 10,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 10,
              ),
              Obx(() {
                return text(
                  context: context,
                  group: null,
                  min: 15.0,
                  partition: 2 / 3,
                  text: _controller._username.value,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w400),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return text(
                  context: context,
                  group: null,
                  min: 12.0,
                  partition: 1 / 2,
                  text: _controller._stringDate.value,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300,
                  ),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return text(
                  context: context,
                  group: null,
                  min: 10.0,
                  partition: 1,
                  text: "Learning ${_controller.learningLanguage.value}",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300,
                  ),
                );
              }),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: UserStatistics(),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return WordsLearned(_controller.wordsLearned.value, group);
              }),
              SizedBox(
                height: 10,
              ),
              InviteFriends(group),
              ElevatedButton(
                onPressed: () {
                  User.logOut();
                },
                child: Text("logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget text({text, style, context, min, group, partition}) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width * partition,
    child: AutoSizeText(
      text,
      maxLines: 1,
      group: group,
      minFontSize: min,
      style: style,
    ),
  );
}

class ProfileController extends GetxController {
  RxString _avatar = "".obs;
  RxString _username = "sampleUsername".obs;
  Rx<DateTime> _date = DateTime.now().obs;
  RxString _stringDate = "sampleDate".obs;
  RxString _learningLanguage = "sampleLanguage".obs;
  RxInt _rank = 0.obs;
  RxInt _wordsLearned = 0.obs;

  RxString get avatar => _avatar;

  set avatar(RxString value) {
    _avatar = value;
  }

  RxString get username => _username;

  set username(RxString value) {
    _username = value;
  }

  Rx<DateTime> get date => _date;

  set date(Rx<DateTime> value) {
    _date = value;
  }

  RxString get stringDate => _stringDate;

  set stringDate(RxString value) {
    _stringDate = value;
  }

  RxString get learningLanguage => _learningLanguage;

  set learningLanguage(RxString value) {
    _learningLanguage = value;
  }

  RxInt get rank => _rank;

  set rank(RxInt value) {
    _rank = value;
  }

  RxInt get wordsLearned => _wordsLearned;

  set wordsLearned(RxInt value) {
    _wordsLearned = value;
  }
}
