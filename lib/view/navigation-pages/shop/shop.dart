import 'package:flutter/material.dart';
import 'package:rabbito/view/navigation-pages/shop/avatar_card.dart';
import 'package:rabbito/view/navigation-pages/shop/shop_card.dart';

Widget shopMenu(BuildContext context) {

  return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: SingleChildScrollView( child: Column(
      children: [
        Row(
          children: [
            Expanded(child: shopCard(new ShopItem(
                deepColor: const Color(0xff1f6e5c),
                shadowColor: const Color(0xff5cd0b7),
                lightColor: const Color(0xffdefff9),
                width: 200, height: 300,
                name: 'Buy Coin',
                description: 'Buy coin to enjoy game more and improve your English!',
                imageURL: 'assets/images/appbar/coin.png',
                price: 100.0))),
            Expanded(child: shopCard(new ShopItem(
                deepColor: const Color(0xffcd1517),
                shadowColor: const Color(0xffee9693),
                lightColor: const Color(0xfffee5e4),
                width: 200, height: 300,
                name: 'Buy Heart',
                description: 'Buy heart to do anything you want and improve more and more in game!!',
                imageURL: 'assets/images/appbar/heart.png',
                price: 200.0)))
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0)),
        Row(
          children: [
            Expanded(child: shopCard(new ShopItem(
                deepColor: const Color(0xff8d6a2a),
                shadowColor: const Color(0xfff3cd79),
                lightColor: const Color(0xfffff2d4),
                width: 200, height: 300,
                name: 'Buy Rabbito',
                description: 'buy Rabbito Logo with different styles in a pack for yourself!',
                imageURL: 'assets/images/rabbit/Eating_carrot.png',
                price: 300.0))),
            Expanded(child: shopCard(new ShopItem(
                deepColor: const Color(0xff3c50dd),
                shadowColor: const Color(0xff8d92ea),
                lightColor: const Color(0xffedeeff),
                width: 200, height: 300,
                name: 'Buy Infinite Heart',
                description: 'Buy infinite heart to do anything you want in the game without any limits!',
                imageURL: 'assets/images/appbar/infinite.png',
                price: 500.0)))
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(17, 12, 0, 0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Avatars >',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.black
                  ),
                )

            )
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(6, 3, 5, 5),
          child: SizedBox(
            height: 191,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                avatarCard(new AvatarIcon(name: 'Avatar', imageURL: 'assets/images/logo.png', price: 50)),
                avatarCard(new AvatarIcon(name: 'Avatar', imageURL: 'assets/images/logo.png', price: 50)),
                avatarCard(new AvatarIcon(name: 'Avatar', imageURL: 'assets/images/logo.png', price: 50)),
                avatarCard(new AvatarIcon(name: 'Avatar', imageURL: 'assets/images/logo.png', price: 50)),
                avatarCard(new AvatarIcon(name: 'Avatar', imageURL: 'assets/images/logo.png', price: 50)),
                avatarCard(new AvatarIcon(name: 'Avatar', imageURL: 'assets/images/logo.png', price: 50)),
                avatarCard(new AvatarIcon(name: 'Avatar', imageURL: 'assets/images/logo.png', price: 50))
              ],
            ),
          )
        )
      ],
    ),
  ));
}