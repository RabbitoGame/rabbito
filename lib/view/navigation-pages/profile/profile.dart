import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/global/strings/image_strings.dart';
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

  @override
  Widget build(BuildContext context) {
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
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      child: Image.asset(ImageStrings.logoAsset, width: 120.0),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Obx(() {
                return Text(
                  _controller._username.value,
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
                return Text(
                  _controller._stringDate.value,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return Text(
                  "Learning ${_controller.learningLanguage.value}",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  elevation: 2.0,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Text(
                        "Awards",
                        style: TextStyle(
                            letterSpacing: 2.0, fontWeight: FontWeight.w300),
                      ))),
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
                return WordsLearned(_controller.wordsLearned.value);
              }),
              SizedBox(
                height: 10,
              ),
              InviteFriends(),
            ],
          ),
        ),
      ),
    );
  }
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
