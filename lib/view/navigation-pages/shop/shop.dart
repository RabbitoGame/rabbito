import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/view/navigation-pages/shop/avatar_card.dart';
import 'package:rabbito/view/navigation-pages/shop/shop_card.dart';
import 'package:tapsell_plus/tapsell_plus.dart';

import 'avatar_item.dart';
import 'avatars.dart';
import 'bundle_card.dart';

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
  final deepBlue = const Color(0xff2874A6);
  final shadowBlue = const Color(0xff85C1E9);
  final lightBlue = const Color(0xffD6EAF8);
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
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: '100 Coins',
                description: '',
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0,
                value_added: 10
            ))),
            Expanded(child:  shopCard(new ShopItem(
                deepColor: deepGreen,
                shadowColor: shadowGreen,
                lightColor: lightGreen,
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: '200 Coins',
                description: '',
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0,
                value_added: 12
            ))),
            Expanded(child:   shopCard(new ShopItem(
                deepColor: deepGreen,
                shadowColor: shadowGreen,
                lightColor: lightGreen,
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: '500 Coins',
                description: '', //100 Coins package is a cool improvement!
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0,
                value_added: 15
            ))),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child:  shopCard(new ShopItem(
                deepColor: deepGreen,
                shadowColor: shadowGreen,
                lightColor: lightGreen,
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: '1000 Coins',
                description: '',
                imageURL: 'assets/images/packs/coin_pack1.png',
                price: 100.0,
                value_added: 18
            ))),
            Expanded(child:   shopCard(new ShopItem(
                deepColor: deepGreen,
                shadowColor: shadowGreen,
                lightColor: lightGreen,
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: '5000 Coins',
                description: '',
                imageURL: 'assets/images/packs/coin_pack2.png',
                price: 100.0,
                value_added: 20
            ))),
            Expanded(child:   shopCard(new ShopItem(
                deepColor: deepGreen,
                shadowColor: shadowGreen,
                lightColor: lightGreen,
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: '50000 Coins',
                description: '',
                imageURL: 'assets/images/packs/coin_pack3.png',
                price: 100.0,
                value_added: 25
            ))),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child: bundleCard(new BundleItem(
                deepColor: deepYellow,
                shadowColor: shadowYellow,
                lightColor: lightYellow,
                width: MediaQuery.of(context).size.width, height: 162,
                name: 'Special Bundle for You',
                description: 'Buy infinite heart to do anything in the game without any limits!',
                imageURL: 'assets/images/appbar/cup.png',
                price: 500.0,
                last_price: 600,
                discount_percentage: 20
            )))
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child: shopCard(new ShopItem(
                deepColor: deepRed,
                shadowColor: shadowRed,
                lightColor: lightRed,
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: '3 Hearts',
                description: '',
                imageURL: 'assets/images/appbar/heart.png',
                price: 100.0,
                value_added: 10
            ))),
            Expanded(child: shopCard(new ShopItem(
                deepColor: deepRed,
                shadowColor: shadowRed,
                lightColor: lightRed,
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: 'Fill Hearts',
                description: '',
                imageURL: 'assets/images/packs/heart_pack2.png',
                price: 100.0,
                value_added: 14
            ))),
            Expanded(child: shopCard(new ShopItem(
                deepColor: deepRed,
                shadowColor: shadowRed,
                lightColor: lightRed,
                width: MediaQuery.of(context).size.width*0.3, height: 131,
                name: 'Infinite',
                description: '',
                imageURL: 'assets/images/appbar/infinite.png',
                price: 100.0,
                value_added: 18
            ))),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child: avatar(new AvatarItem(
                deepColor: deepPurple,
                shadowColor: shadowPurple,
                lightColor: lightPurple,
                width: 200, height: 150,
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