import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_widget2/views/profile_widget.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/model/user.dart';
import 'package:rabbito/view/navigation-pages/profile/invite_friends.dart';
import 'package:rabbito/view/navigation-pages/profile/user_statistics.dart';
import 'package:rabbito/view/navigation-pages/profile/words_learned.dart';
import 'package:rabbito/view/widgets/loading.dart';
import 'package:intl/intl.dart';

Widget profileMenu(BuildContext context) {
  return ProfileUI2();
}

class ProfileUI2 extends StatelessWidget {
  ProfileController _controller = Get.put(ProfileController());
  var height = SizeConfig.blockSizeVertical;

  @override
  Widget build(BuildContext context) {
    print(
        'assets/images/avatars/Faces/face_${AppController.appController.currUser!.value.avatar!.face}.png');
    return FutureBuilder(
      future: _controller.getProfileInfo(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // return profileWidget(context);
        if (_controller.isDataReady.value) {
          return profileWidget(context);
        } else {
          return LoadingWidget(Indicator.ballBeat);
        }
      },
    );
  }

  Widget profileWidget(context) {
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
                    child: ProfileWidget(
                      AppController.appController.currUser!.value.avatar!,
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
                  text: AppController.isLoggedIn()
                      ? DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse(_controller.stringDate.value))
                      : "",
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
                    win: _controller._win.value,
                    loose: _controller._loose.value,
                    rank: _controller._rank.value,
                    leagueString: User.calculateLeagueImageString(name: _controller._leagueString.value),
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return WordsLearned(_controller.wordsLearned.value , group);
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
  RxString _stringDate = "sampleDate".obs;
  RxInt _rank = 0.obs;
  RxString _leagueString = "".obs;
  RxInt _wordsLearned = 0.obs;
  RxInt _win = 0.obs;
  RxInt _loose = 0.obs;
  RxInt _corr_matches = 0.obs;
  RxInt _wrong_matches = 0.obs;

  RxBool isDataReady = false.obs;

  @override
  void onInit() {
    // getProfileInfo();
    super.onInit();
  }

  Future getProfileInfo() async {
    isDataReady.value = false;
    var result = await User.getUserDetails();
    print("result from User.getUserDetails(): " + result.toString());
    if (result[RequestStrings.status]) {
      var data = result[RequestStrings.data];
      //data is ready
      _wordsLearned.value = data[UserStrings.totalLearnedWordsCount];
      _stringDate.value = data[UserStrings.joinDate];
      // _leagueString.value = User.calculateLeagueImageString(name: mLeague, layer: mLayer,);
      _rank.value = data["position"] == "-" ? -1 : data["position"];
      _leagueString.value = data["rank"];
      _win.value = data[UserStrings.win];
      _loose.value = data[UserStrings.loose];
      _corr_matches.value = data[UserStrings.correctMatches];
      isDataReady.value = true;
    } else {
      // User.logOut();
      print("getProfileInfo: unsuccessful");
    }
  }

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
