import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/view/navigation-pages/shop/avatar_card.dart';
import 'package:rabbito/view/navigation-pages/shop/shop_card.dart';

import 'avatar_item.dart';
import 'avatars.dart';

Widget shopMenu(BuildContext context) {

  final deepGreen = const Color(0xff1f6e5c);
  final shadowGreen = const Color(0xff5cd0b7);
  final lightGreen = const Color(0xffdefff9);
  //
  final deepRed = const Color(0xffcd1517);
  final shadowRed = const Color(0xffee9693);
  final lightRed = const Color(0xfffee5e4);
  //
  final deepYellow = const Color(0xff8d6a2a);
  final shadowYellow = const Color(0xfff3cd79);
  final lightYellow = const Color(0xfffff2d4);
  //
  final deepPurple = const Color(0xff3c50dd);
  final shadowPurple = const Color(0xff8d92ea);
  final lightPurple = const Color(0xffedeeff);
  //

  return Container(
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: SingleChildScrollView( child: Column(
      children: [
        // Padding(
        //     padding: EdgeInsets.fromLTRB(6, 3, 5, 5),
        //     child: SizedBox(
        //       height: 160,
        //       child: ListView(
        //         scrollDirection: Axis.horizontal,
        //         children: [
        //           shopCard(new ShopItem(
        //               deepColor: deepGreen,
        //               shadowColor: shadowGreen,
        //               lightColor: lightGreen,
        //               width: 150, height: 160,
        //               name: '100 Coins',
        //               description: '',
        //               imageURL: 'assets/images/appbar/coin.png',
        //               price: 100.0)),
        //           shopCard(new ShopItem(
        //               deepColor: deepGreen,
        //               shadowColor: shadowGreen,
        //               lightColor: lightGreen,
        //               width: 150, height: 160,
        //               name: '200 Coins',
        //               description: '',
        //               imageURL: 'assets/images/appbar/coin.png',
        //               price: 100.0)),
        //           shopCard(new ShopItem(
        //               deepColor: deepGreen,
        //               shadowColor: shadowGreen,
        //               lightColor: lightGreen,
        //               width: 150, height: 160,
        //               name: '500 Coins',
        //               description: '', //100 Coins package is a cool improvement!
        //               imageURL: 'assets/images/appbar/coin.png',
        //               price: 100.0)),
        //           shopCard(new ShopItem(
        //               deepColor: deepYellow,
        //               shadowColor: shadowYellow,
        //               lightColor: lightYellow,
        //               width: 150, height: 160,
        //               name: '1000 Coins',
        //               description: '',
        //               imageURL: 'assets/images/appbar/coin.png',
        //               price: 100.0)),
        //           shopCard(new ShopItem(
        //               deepColor: deepYellow,
        //               shadowColor: shadowYellow,
        //               lightColor: lightYellow,
        //               width: 150, height: 160,
        //               name: '5000 Coins',
        //               description: '',
        //               imageURL: 'assets/images/appbar/coin.png',
        //               price: 100.0)),
        //           shopCard(new ShopItem(
        //               deepColor: deepYellow,
        //               shadowColor: shadowYellow,
        //               lightColor: lightYellow,
        //               width: 150, height: 160,
        //               name: '50000 Coins',
        //               description: '',
        //               imageURL: 'assets/images/appbar/coin.png',
        //               price: 100.0))
        //           ],
        //       ),
        //     )
        // ),
        Row(
          children: [
            Expanded(child: shopCard(new ShopItem(
                deepColor: deepGreen,
                shadowColor: shadowGreen,
                lightColor: lightGreen,
                width: 150, height: 160,
                name: '100 Coins',
                description: '',
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0)),),
            Expanded(child:  shopCard(new ShopItem(
                deepColor: deepGreen,
                shadowColor: shadowGreen,
                lightColor: lightGreen,
                width: 150, height: 160,
                name: '200 Coins',
                description: '',
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0)),),
            Expanded(child:   shopCard(new ShopItem(
                deepColor: deepGreen,
                shadowColor: shadowGreen,
                lightColor: lightGreen,
                width: 150, height: 160,
                name: '500 Coins',
                description: '', //100 Coins package is a cool improvement!
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0)),),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child:  shopCard(new ShopItem(
                deepColor: deepYellow,
                shadowColor: shadowYellow,
                lightColor: lightYellow,
                width: 150, height: 160,
                name: '1000 Coins',
                description: '',
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0)),),
            Expanded(child:   shopCard(new ShopItem(
                deepColor: deepYellow,
                shadowColor: shadowYellow,
                lightColor: lightYellow,
                width: 150, height: 160,
                name: '5000 Coins',
                description: '',
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0)),),
            Expanded(child:   shopCard(new ShopItem(
                deepColor: deepYellow,
                shadowColor: shadowYellow,
                lightColor: lightYellow,
                width: 150, height: 160,
                name: '50000 Coins',
                description: '',
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0))),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child: shopCard(new ShopItem(
                deepColor: deepYellow,
                shadowColor: shadowYellow,
                lightColor: lightYellow,
                width: 200, height: 170,
                name: 'Special Bundle for You',
                description: 'Buy infinite heart to do anything in the game without any limits!',
                imageURL: 'assets/images/appbar/cup.png',
                price: 500.0)))
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child: shopCard(new ShopItem(
                deepColor: deepRed,
                shadowColor: shadowRed,
                lightColor: lightRed,
                width: 145, height: 185,
                name: '3 Hearts',
                description: '100 Coins package is a cool improvement!',
                imageURL: 'assets/images/appbar/heart.png',
                price: 100.0))),
            Expanded(child: shopCard(new ShopItem(
                deepColor: deepRed,
                shadowColor: shadowRed,
                lightColor: lightRed,
                width: 145, height: 185,
                name: 'Fill Hearts',
                description: '100 Coins package is a cool improvement!',
                imageURL: 'assets/images/appbar/heart.png',
                price: 100.0))),
            Expanded(child: shopCard(new ShopItem(
                deepColor: deepRed,
                shadowColor: shadowRed,
                lightColor: lightRed,
                width: 145, height: 185,
                name: 'Infinite',
                description: '100 Coins package is a cool improvement!',
                imageURL: 'assets/images/appbar/infinite.png',
                price: 100.0))),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child: avatar(new AvatarItem(
                deepColor: deepPurple,
                shadowColor: shadowPurple,
                lightColor: lightPurple,
                width: 200, height: 177,
                name: 'You Can Choose Your Avatar!!',
              onPressed: () {
                Get.to(AvatarsScreen(context));
              }
               )))
          ],
        )
      ],
    ),
  ));
}

// deepColor: const Color(0xff1E90FF),
// shadowColor: const Color(0xff42C0FB),
// lightColor: const Color(0xffBFEFFF),