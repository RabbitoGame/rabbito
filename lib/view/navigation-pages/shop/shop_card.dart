import 'package:flutter/material.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

class ShopItem {

  late Color lightColor;
  late Color shadowColor;
  late Color deepColor;
  late double width;
  late double height;
  late String name;
  late String description;
  late String imageURL;
  late double price;

  ShopItem({
    required this.deepColor,
    required this.shadowColor,
    required this.lightColor,
    required this.width,
    required this.height,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.price,
  });

}

Widget shopCard(ShopItem item) {

  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      width: item.width,
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
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Image.asset(item.imageURL, width: 60.0, height:60.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
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
                  child: Text(
                    item.price.toString() + " \$",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.amber
                    ),
                  ),
                )
              ],
            )
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 8),
              child: Text(
                item.description,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: item.shadowColor
                ),
              ),
            )
          ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
              width: double.infinity,
              child: CustomContainer(
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
  );
}