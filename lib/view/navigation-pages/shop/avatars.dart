import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/view/navigation-pages/shop/avatar_card.dart';
import 'package:rabbito/view/navigation-pages/shop/shop_card.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

Widget AvatarsScreen(BuildContext context) {
  AvatarsController _controller = Get.put(AvatarsController());

  Future<bool> _onWillPop() async {
    return (await  showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SizedBox(
                height: 142,
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
                                    onPressed: () {},
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
              right: 65,
              width: 30,
              child: FlatButton(
                minWidth: 25,
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
    body: Stack(
      children: [
        Container(
          // color: Colors.white,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wallpapers/ShopPageWallpaper.png"),
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
              ],
            )
        ),
        Positioned(
            bottom: 30.0,
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
                          avatarCard(new AvatarIcon(name: 'Face 1', imageURL: 'assets/images/avatars/Faces/face_1.png', price: 20, onClick: () {
                            _controller.changeFace('assets/images/avatars/Faces/face_1.png', 20, true);
                          }, hasBought: true)),
                          avatarCard(new AvatarIcon(name: 'Face 2', imageURL: 'assets/images/avatars/Faces/face_2.png', price: 30, onClick: () {
                            _controller.changeFace('assets/images/avatars/Faces/face_2.png', 30, false);
                          }, hasBought: false)),
                          avatarCard(new AvatarIcon(name: 'Face 3', imageURL: 'assets/images/avatars/Faces/face_3.png', price: 40, onClick: () {
                            _controller.changeFace('assets/images/avatars/Faces/face_3.png', 40, false);
                          }, hasBought: false)),
                          avatarCard(new AvatarIcon(name: 'Face 4', imageURL: 'assets/images/avatars/Faces/face_4.png', price: 50, onClick: () {
                            _controller.changeFace('assets/images/avatars/Faces/face_4.png', 50, false);
                          }, hasBought: false)),
                        ],
                      ),
                    )
                ),
            ),
        )
      ],
    )
  ));
}

class AvatarsController extends GetxController {
  RxString _face = 'assets/images/avatars/Faces/face_1.png'.obs;
  RxString _clothes = 'assets/images/avatars/Clothes/cloth_1.png'.obs;
  RxString _eyes = 'assets/images/avatars/Eyes/eye_1.png'.obs;
  RxString _mouth = 'assets/images/avatars/Mouths/mouth_1.png'.obs;
  RxString _hair = 'assets/images/avatars/Hairs/hair_1.png'.obs;
  RxString _specials = 'assets/images/avatars/Specials/special_1.png'.obs;

  RxInt _totalCost = 0.obs;
  RxInt _faceCost = 0.obs;
  RxInt _clothesCost = 0.obs;
  RxInt _eyesCost = 0.obs;
  RxInt _mouthCost = 0.obs;
  RxInt _hairCost = 0.obs;
  RxInt _specialsCost = 0.obs;

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