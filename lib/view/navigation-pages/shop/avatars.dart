import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/view/navigation-pages/shop/avatar_card.dart';
import 'package:rabbito/view/navigation-pages/shop/shop_card.dart';

Widget AvatarsScreen(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.purple,
      title: Text('Avatars'),
    ),
    body: Stack(
      children: [
        Container(
          // color: Colors.white,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/avatars/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 77.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffb9ebfd),
                          border: Border.all(
                            color: const Color(0xffb9ebfd),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      // padding: EdgeInsets.all(1.0),
                      margin: EdgeInsets.all(1.0),
                      child:  FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text(
                              'Faces',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Faces/face_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 77.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffb9ebfd),
                          border: Border.all(
                            color: const Color(0xffb9ebfd),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      // padding: EdgeInsets.all(1.0),
                      margin: EdgeInsets.all(1.0),
                      child:  FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text(
                              'Clothes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Clothes/cloth_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 77.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffb9ebfd),
                          border: Border.all(
                            color: const Color(0xffb9ebfd),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      // padding: EdgeInsets.all(1.0),
                      margin: EdgeInsets.all(1.0),
                      child:  FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text(
                              'Eyes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Eyes/eye_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 77.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffb9ebfd),
                          border: Border.all(
                            color: const Color(0xffb9ebfd),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      // padding: EdgeInsets.all(1.0),
                      margin: EdgeInsets.all(1.0),
                      child:  FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text(
                              'Mouths',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Mouths/mouth_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 77.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffb9ebfd),
                          border: Border.all(
                            color: const Color(0xffb9ebfd),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      // padding: EdgeInsets.all(1.0),
                      margin: EdgeInsets.all(1.0),
                      child:  FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text(
                              'Hairs',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Hairs/hair_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80.0,
                      decoration: BoxDecoration(
                          color: const Color(0xffb9ebfd),
                          border: Border.all(
                            color: const Color(0xffb9ebfd),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      // padding: EdgeInsets.all(1.0),
                      margin: EdgeInsets.all(1.0),
                      child:  FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text(
                              'Specials',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Specials/special_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 80.0)),
                Container(
                    height: 300,
                    width: 300,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightBlueAccent,
                        border: Border.all(width: 1, color: Colors.blueAccent)
                    ),
                    child: Container(
                      width: 250.0,
                      height: 250.0,
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
              ],
            )
        ),
        Positioned(
            bottom: 50.0,
            right: 0,
            left: 0,
            child: Center(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(6, 3, 5, 5),
                    child: SizedBox(
                      height: 191,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          avatarCard(new AvatarIcon(name: 'Face 1', imageURL: 'assets/images/avatars/Faces/face_1.png', price: 50)),
                          avatarCard(new AvatarIcon(name: 'Face 2', imageURL: 'assets/images/avatars/Faces/face_2.png', price: 50)),
                          avatarCard(new AvatarIcon(name: 'Face 3', imageURL: 'assets/images/avatars/Faces/face_3.png', price: 50)),
                          avatarCard(new AvatarIcon(name: 'Face 4', imageURL: 'assets/images/avatars/Faces/face_4.png', price: 50)),
                        ],
                      ),
                    )
                ),
            ),
        )
      ],
    )
  );
}