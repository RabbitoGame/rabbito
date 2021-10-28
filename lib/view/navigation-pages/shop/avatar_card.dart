import 'package:flutter/material.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

class AvatarIcon {

  late String name;
  late String imageURL;
  late double price;
  late var onClick;
  late bool hasBought;
  late var height;

  AvatarIcon({
    required this.name,
    required this.imageURL,
    required this.price,
    required this.onClick,
    required this.hasBought,
    required this.height
  });

}

Widget avatarCard(AvatarIcon item) {

  return Container(
    // height: 170,
    width: 170,
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
    padding: EdgeInsets.all((item.height<(700))? 2:5),
    decoration: BoxDecoration(
        color: const Color(0xffe3e0e0),
        border: Border.all(
          color: const Color(0xffe3e0e0),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: const Color(0xffafafaf), spreadRadius: 3, blurRadius: 5.0,)
        ]
    ),
    child: Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, (item.height<(700))? 1:4, 0, (item.height<(700))? 1:4),
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: AssetImage(item.imageURL),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(0, (item.height<(700))? 2:4, 0, (item.height<(700))? 2:4),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.black
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(3, (item.height<(700))? 1:2, 3, (item.height<(700))? 1:2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Text(
                    item.hasBought? "Has Bought" : item.price.toString() + " C",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: item.hasBought? 14.0 : 17.0,
                        color: Colors.amber
                    ),
                  ),
                )
              ],
            )
        ),
        Center(
          child: Container(
              padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
              width: double.infinity,
              child: CustomContainer(
                child: Text(
                  item.hasBought? "Select" : "Buy",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onPressed: item.onClick,
                outerColor: item.hasBought? Colors.green : Colors.orange,
                innerColor: item.hasBought? Colors.lightGreen : Colors.orangeAccent,
                minHeight: (item.height<(700))? 30:40,
              ))
        )
      ],
    ),
  );
}