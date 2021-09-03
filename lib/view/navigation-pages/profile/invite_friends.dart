import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.card_giftcard,
              size: 50,
              color: Colors.lightBlueAccent,
            ),
            title: Text("invite-gift".tr),
            subtitle: Text("invite-gift-message".tr),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            width: double.infinity,
            child: CustomContainer(
              Text(
                "invite-friends".tr,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
