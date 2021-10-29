import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/model/user.dart';
import 'package:get/get.dart';
import 'package:rabbito/view/navigation-pages/shop/avatar_card.dart';
import 'package:rabbito/view/navigation-pages/shop/shop.dart';
import 'package:rabbito/view/navigation-pages/shop/shop_card.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

Widget AvatarsScreen(BuildContext context) {
  AvatarsController _controller = Get.put(AvatarsController());
  final box = GetStorage();
  box.write('assets/images/avatars/Faces/face_1.png', 'bought');
  box.write('assets/images/avatars/Cloths/cloth_1.png', 'bought');
  box.write('assets/images/avatars/Eyes/eye_1.png', 'bought');
  box.write('assets/images/avatars/Mouths/mouth_1.png', 'bought');
  box.write('assets/images/avatars/Hairs/hair_1.png', 'bought');
  box.write('assets/images/avatars/Specials/special_1.png', 'bought');


  hasBought(String key) {
    if(box.hasData(key)) {
      if(box.read(key) == 'bought') {
        return true;
      }
    }
   return false;
  }

  payBill(int amount) async {
    print('request sent');
    print(amount);
    var result = await User.transactions(
      amount: amount,
      isIncrease: false,
      isHeart: false,
    );
    print('request sent');
    if (result[RequestStrings.status]) {
        print('request done successfully!');
        var x = AppController.appController.currUser!.value.coin! + amount;
        AppController.appController.currUser!.update(( user) =>
        (user as User).coin = x );
        box.write(_controller._face.value, 'bought');
        box.write(_controller._clothes.value, 'bought');
        box.write(_controller._eyes.value, 'bought');
        box.write(_controller._mouth.value, 'bought');
        box.write(_controller._hair.value, 'bought');
        box.write(_controller._specials.value, 'bought');
    }
    Navigator.of(context).pop(true);
  }

  Future<bool> _onWillPop() async {
    print('heighttttt');
    print(MediaQuery.of(context).size.height);
    return (await  showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SizedBox(
                height: 152,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      right: -30.0,
                      top: -30.0,
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                                  child: Obx(() => Text('${_controller._totalCost.value} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0
                                    ),))
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                                child: Image.asset('assets/images/appbar/coin.png', width: 30.0, height: 30.0),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Obx(() =>  Text(
                          'Your bill costs ${_controller._totalCost.value} Coins. Do you want to pay it?!',
                          style: TextStyle(
                              fontSize: 16.0
                          ),
                        )),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  width: double.infinity,
                                  child: CustomContainer(
                                    child: Text(
                                      "Pay Bill",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      payBill(_controller._totalCost.value);
                                    },
                                    outerColor: Colors.orange,
                                    innerColor: Colors.orangeAccent,
                                    minHeight: 40,
                                  )
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 10)),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                    width: double.infinity,
                                    child: CustomContainer(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      outerColor: Colors.red,
                                      innerColor: Colors.redAccent,
                                      minHeight: 40,
                                    )
                                )
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
          );
        })) ?? false;
  }

  return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
    appBar: AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.purple,
      title: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text('Avatars'),
            ),
          ),
          Positioned(
              top: 0,
              right: 75,
              width: 30,
              height: 12,
              child: FlatButton(
                // minWidth: 25,
                child: Icon(Icons.shopping_cart, size: 24, color: Colors.white),
                onPressed: () {
                 _onWillPop();
                },
              )
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Row(
                children: [
                  Obx(() => Text("${_controller._totalCost.value} ")),
                  Image.asset('assets/images/appbar/coin.png', width: 20.0,)
                ],
              )
          )
        ],
      )
    ),
    body: SingleChildScrollView( child: Column(
      children: [
        Container(
          // color: Colors.white,
          height: MediaQuery.of(context).size.height-60-MediaQuery.of(context).padding.bottom-MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wallpapers/ShopPageWallpaper.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(child: Container(
                      // width: 77.0,
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
                        onPressed: () {
                          _controller.changeSkin('Face', 'face_', 4);
                        },
                        child: Expanded(child:Column(
                          children: [
                            Text(
                              'Faces',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: (MediaQuery.of(context).size.width<(420))? 10:16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Faces/face_1.png', width: 50.0,),
                          ],
                        ),)
                      ),
                    )),
                    Expanded(child: Container(
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
                        onPressed: () {
                          _controller.changeSkin('Cloth', 'cloth_', 6);
                        },
                        child: Column(
                          children: [
                            Text(
                              'Cloths',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: (MediaQuery.of(context).size.width<(420))? 10:16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Cloths/cloth_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),),
                    Expanded(child: Container(
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
                        onPressed: () {
                          _controller.changeSkin('Eye', 'eye_', 4);
                        },
                        child: Column(
                          children: [
                            Text(
                              'Eyes',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: (MediaQuery.of(context).size.width<(420))? 10:16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Eyes/eye_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),),
                   Expanded(child:  Container(
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
                       onPressed: () {
                         _controller.changeSkin('Mouth', 'mouth_', 5);
                       },
                       child: Column(
                         children: [
                           Text(
                             'Mouths',
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: (MediaQuery.of(context).size.width<(420))? 8:16.0,
                                 color: Colors.blueAccent
                             ),
                           ),
                           Image.asset('assets/images/avatars/Mouths/mouth_1.png', width: 50.0,),
                         ],
                       ),
                     ),
                   ),),
                    Expanded(child: Container(
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
                        onPressed: () {
                          _controller.changeSkin('Hair', 'hair_', 18);
                        },
                        child: Column(
                          children: [
                            Text(
                              'Hairs',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: (MediaQuery.of(context).size.width<(420))? 10:16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Hairs/hair_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),),
                    Expanded(child: Container(
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
                        onPressed: () {
                          _controller.changeSkin('Special', 'special_', 5);
                        },
                        child: Column(
                          children: [
                            Text(
                              'Specials',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: (MediaQuery.of(context).size.width<(420))? 7:16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Image.asset('assets/images/avatars/Specials/special_1.png', width: 50.0,),
                          ],
                        ),
                      ),
                    ),)
                  ],
                ),
                // Padding(padding: EdgeInsets.only(top: 80.0)),
                Container(
                    height: (MediaQuery.of(context).size.height<(750))? ((MediaQuery.of(context).size.height<(450))?150:200):280,
                    width: (MediaQuery.of(context).size.height<(750))? ((MediaQuery.of(context).size.height<(450))?150:200):280,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightBlueAccent,
                        border: Border.all(width: 1, color: Colors.blueAccent)
                    ),
                    child: Container(
                      height: (MediaQuery.of(context).size.height<(750))? ((MediaQuery.of(context).size.height<(450))?135:170):240,
                      width: (MediaQuery.of(context).size.height<(750))? ((MediaQuery.of(context).size.height<(450))?135:170):240,
                      child: Stack(
                        children: [
                          // Obx(() => Image.asset("$face")),
                          Obx(() => Image.asset("${_controller._face.value}")),
                          Obx(() => Image.asset("${_controller._clothes.value}")),
                          Obx(() => Image.asset("${_controller._eyes.value}")),
                          Obx(() => Image.asset("${_controller._mouth.value}")),
                          Obx(() => Image.asset("${_controller._hair.value}")),
                          Obx(() => Image.asset("${_controller._specials.value}")),
                        ],
                      ),
                    )
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(6, 3, 5, 5),
                      child: SizedBox(
                        height: (MediaQuery.of(context).size.height<(750))? ((MediaQuery.of(context).size.height<(450))?125:150):190,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 1', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}1.png', price: 80, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}1.png', 80, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}1.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}1.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<1?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 2', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}2.png', price: 200, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}2.png', 200, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}2.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}2.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<2?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 3', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}3.png', price: 350, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}3.png', 350, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}3.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}3.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<3?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 4', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}4.png', price: 500, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}4.png', 500, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}4.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}4.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<4?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 5', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}5.png', price: 800, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}5.png', 800, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}5.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}5.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<5?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 6', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}6.png', price: 900, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}6.png', 900, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}6.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}6.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<6?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 7', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}7.png', price: 950, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}7.png', 950, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}7.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}7.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<7?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 8', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}8.png', price: 1000, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}8.png', 1000, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}8.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}8.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<8?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 9', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}9.png', price: 1100, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}9.png', 1100, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}9.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}9.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<9?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 10', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}10.png', price: 1100, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}10.png', 1100, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}10.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}10.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<10?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 11', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}11.png', price: 1100, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}11.png', 1100, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}11.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}11.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<11?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 12', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}12.png', price: 1400, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}12.png', 1400, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}12.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}12.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<12?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 13', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}13.png', price: 1500, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}13.png', 1500, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}13.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}13.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<13?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 14', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}14.png', price: 1600, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}14.png', 1600, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}14.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}14.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<14?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 15', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}15.png', price: 1700, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}15.png', 1700, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}15.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}15.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<15?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 16', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}16.png', price: 1800, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}16.png', 1800, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}16.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}16.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<16?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 17', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}17.png', price: 1900, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}17.png', 1900, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}17.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}17.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<17?false:true),
                            ),
                            Obx(() =>  Visibility(child: avatarCard(new AvatarIcon(name: '${_controller._selectedSkin.value} 18', imageURL: 'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}18.png', price: 2000, onClick: () {
                              _controller.whichFunction(_controller._selectedSkin.value,'assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}18.png', 2000, hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}18.png'));
                            }, hasBought: hasBought('assets/images/avatars/${_controller._selectedSkin.value}s/${_controller._selectedSkinUrl.value}18.png'), height: MediaQuery.of(context).size.height)),  visible: _controller._selectedSkinNumber.value<18?false:true),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ],
            )
        ),
      ],)
    )
  ));
}

class AvatarsController extends GetxController {
  RxString _face = 'assets/images/avatars/Faces/face_1.png'.obs;
  RxString _clothes = 'assets/images/avatars/Cloths/cloth_1.png'.obs;
  RxString _eyes = 'assets/images/avatars/Eyes/eye_1.png'.obs;
  RxString _mouth = 'assets/images/avatars/Mouths/mouth_1.png'.obs;
  RxString _hair = 'assets/images/avatars/Hairs/hair_1.png'.obs;
  RxString _specials = 'assets/images/avatars/Specials/special_1.png'.obs;

  // late bool faces = false;
  // late bool clothes = false;
  // late bool eyes = false;
  // late bool mouth = false;
  // late bool hairs = false;
  // late bool specials = false;

  RxString _selectedSkin = 'Face'.obs;
  RxString _selectedSkinUrl = 'face_'.obs;
  RxInt _selectedSkinNumber = 4.obs;

  RxInt _totalCost = 0.obs;
  RxInt _faceCost = 0.obs;
  RxInt _clothesCost = 0.obs;
  RxInt _eyesCost = 0.obs;
  RxInt _mouthCost = 0.obs;
  RxInt _hairCost = 0.obs;
  RxInt _specialsCost = 0.obs;

  void changeSkin(skin, url, number) {
    _selectedSkin.value = skin;
    _selectedSkinUrl.value = url;
    _selectedSkinNumber.value = number;
  }
  void whichFunction(skin, value, price, hasBought) {
    if(skin=='Face') {
      changeFace(value, price, hasBought);
    } else if(skin=='Cloth') {
      changeClothes(value, price, hasBought);
    } else if(skin=='Eye') {
      changeEyes(value, price, hasBought);
    } else if(skin=='Mouth') {
      changeMouth(value, price, hasBought);
    } else if(skin=='Hair') {
      changeHair(value, price, hasBought);
    } else if(skin=='Special') {
      changeSpecials(value, price, hasBought);
    }
  }

  void changeFace(value, price, hasBought) {
    _face.value = value;
    _totalCost.value -= _faceCost.value;
    if(!hasBought) {
      _faceCost.value = price;
      _totalCost.value += _faceCost.value;
    } else {
      _faceCost.value = 0;
    }
  }

  void changeClothes(value, price, hasBought) {
    _clothes.value = value;
    _totalCost.value -= _clothesCost.value;
    if(!hasBought) {
      _clothesCost.value = price;
      _totalCost.value += _clothesCost.value;
    } else {
      _clothesCost.value = 0;
    }
  }

  void changeEyes(value, price, hasBought) {
    _eyes.value = value;
    _totalCost.value -= _eyesCost.value;
    if(!hasBought) {
      _eyesCost.value = price;
      _totalCost.value += _eyesCost.value;
    } else {
      _eyesCost.value = 0;
    }
  }


  void changeMouth(value, price, hasBought) {
    _mouth.value = value;
    _totalCost.value -= _mouthCost.value;
    if(!hasBought) {
      _mouthCost.value = price;
      _totalCost.value += _mouthCost.value;
    } else {
      _mouthCost.value = 0;
    }
  }

  void changeHair(value, price, hasBought) {
    _hair.value = value;
    _totalCost.value -= _hairCost.value;
    if(!hasBought) {
      _hairCost.value = price;
      _totalCost.value += _hairCost.value;
    } else {
      _hairCost.value = 0;
    }
  }

  void changeSpecials(value, price, hasBought) {
    _specials.value = value;
    _totalCost.value -= _specialsCost.value;
    if(!hasBought) {
      _specialsCost.value = price;
      _totalCost.value += _specialsCost.value;
    } else {
      _specialsCost.value = 0;
    }
  }
}