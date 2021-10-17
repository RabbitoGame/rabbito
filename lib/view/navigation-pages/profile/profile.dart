import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_widget2/views/profile_widget.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/model/user.dart';
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
    print(
        'assets/images/avatars/Faces/face_${AppController.appController.currUser!.avatar!.face}.png');
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
                    child: ProfileWidget(
                      AppController.appController.currUser!.avatar!,
                      backgroundColor: Colors.green,
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
                  text: AppController.isLoggedIn()
                      ? AppController.getUsername()
                      : "",
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
                  text:
                      AppController.isLoggedIn() ? AppController.getDate() : "",
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
                  text: AppController.isLoggedIn()
                      ? AppController.getLanguage()
                      : "",
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
                child: Obx(() {
                  return UserStatistics(
                    correctMatches: _controller._corr_matches.value,
                    wrongMatches: _controller._wronng_matches.value,
                    win: _controller._win.value,
                    loose: _controller._loose.value,
                    rank: _controller._rank.value,
                    league: _controller._league.value,
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return WordsLearned(_controller.wordsLearned.value + 5, group);
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

  void getProfileInfo() async {
    var result = await User.getUserDetails();
    if (result[RequestStrings.status]) {
      _controller._stringDate.value = result[UserStrings.joinDate];
      _controller._league.value = result[UserStrings.league];
      _controller._rank.value = result[UserStrings.rank];
      _controller._wordsLearned.value = result[UserStrings.wordsLearned];
      _controller._win.value = result[UserStrings.win];
      _controller._loose.value = result[UserStrings.loose];
      _controller._corr_matches.value = result[UserStrings.correctMatches];
      _controller._wronng_matches.value = result[UserStrings.wrongMatches];
    } else {
      // User.logOut();
      print("getProfileInfo: unsuccessful");
    }
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
  RxString _stringDate = "sampleDate".obs;
  RxInt _rank = 0.obs;
  RxInt _league = 0.obs;
  RxInt _wordsLearned = 0.obs;
  RxInt _win = 0.obs;
  RxInt _loose = 0.obs;
  RxInt _corr_matches = 0.obs;
  RxInt _wronng_matches = 0.obs;

  set avatar(RxString value) {
    _avatar = value;
  }

  RxString get stringDate => _stringDate;

  set stringDate(RxString value) {
    _stringDate = value;
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
