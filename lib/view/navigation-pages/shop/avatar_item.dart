import 'package:flutter/material.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

class AvatarItem {

  late Color lightColor;
  late Color shadowColor;
  late Color deepColor;
  late double width;
  late double height;
  late String name;
  late var onPressed;

  AvatarItem({
    required this.deepColor,
    required this.shadowColor,
    required this.lightColor,
    required this.width,
    required this.height,
    required this.name,
    required this.onPressed,
  });

}

Widget avatar(AvatarItem item) {

  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
    padding: EdgeInsets.fromLTRB(5, 10, 5, 2),
    width: item.width,
    height: item.height,
    decoration: BoxDecoration(
        color: item.lightColor,
        border: Border.all(
          color: item.lightColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: item.shadowColor, spreadRadius: 3, blurRadius: 5.0,)
        ]
    ),
    child: Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
            child: Container(
              width: 80.0,
              height: 80.0,
              child: Stack(
                children: [
                  Image.asset('assets/images/avatars/Faces/face_1.png'),
                  Image.asset('assets/images/avatars/Clothes/cloth_1.png'),
                  Image.asset('assets/images/avatars/Eyes/eye_1.png'),
                  Image.asset('assets/images/avatars/Mouths/mouth_1.png'),
                  Image.asset('assets/images/avatars/Hairs/hair_1.png'),
                  Image.asset('assets/images/avatars/Specials/special_1.png'),
                ],
              ),
            )
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: item.deepColor
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(3, 2, 3, 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                )
              ],
            )
        ),
        Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            width: double.infinity,
            child: CustomContainer(
              child: Text(
                'Create Your Own Avatar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              onPressed: item.onPressed,
              minHeight: 40,
            ),
          ),
        )
      ],
    ),
  );
}