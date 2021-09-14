import 'package:flutter/material.dart';
import 'package:rabbito/view/navigation-pages/profile/achievements.dart';
import 'package:rabbito/view/navigation-pages/profile/friends_tabbar.dart';
import 'package:rabbito/view/navigation-pages/profile/invite_friends.dart';
import 'package:rabbito/view/navigation-pages/profile/user_statistics.dart';
import 'package:rabbito/view/navigation-pages/profile/words_learned.dart';

Widget profileMenu(BuildContext context) {
  return ProfileUI2();
}

class ProfileUI2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Image.asset('assets/images/logo.png', width: 120.0),
                    radius: 60.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Sina Elahimanesh",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Joined September 2021",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Learning English",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                elevation: 2.0,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
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
            WordsLearned(15),
            SizedBox(
              height: 10,
            ),
            InviteFriends(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 500,
              child: FriendsTabBar(),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 400,
              child: UserAchievements(),
            ),
          ],
        ),
      ),
    );
  }
}
// SizedBox(
//   height: 50,
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     RaisedButton(
//       onPressed: (){
//       },
//       shape:  RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(80.0),
//       ),
//       child: Ink(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Colors.pink,Colors.redAccent]
//           ),
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         child: Container(
//           constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
//           alignment: Alignment.center,
//           child: Text(
//             "Contact me",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12.0,
//                 letterSpacing: 2.0,
//                 fontWeight: FontWeight.w300
//             ),
//           ),
//         ),
//       ),
//     ),
//     RaisedButton(
//       onPressed: (){
//       },
//       shape:  RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(80.0),
//       ),
//       child: Ink(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [Colors.pink,Colors.redAccent]
//           ),
//           borderRadius: BorderRadius.circular(80.0),
//         ),
//         child: Container(
//           constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
//           alignment: Alignment.center,
//           child: Text(
//             "Portfolio",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12.0,
//                 letterSpacing: 2.0,
//                 fontWeight: FontWeight.w300
//             ),
//           ),
//         ),
//       ),
//     )
//   ],
// )
