import 'dart:js';

import 'package:auto_size_text/auto_size_text.dart';
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
  late double value_added;

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
    required this.value_added
  });

}

Widget shopCard(ShopItem item) {

  return Container(
    width: item.width,
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
    padding: EdgeInsets.fromLTRB((item.width<(400/3))? 0:2.5 , 2, (item.width<(400/3))? 0:2.5, 3),
      // width: item.width,
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
              child: Image.asset(item.imageURL, width: 40.0, height: 40.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB((item.width<(400/3))? 1:3, 2, (item.width<(400/3))? 1:3, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: AutoSizeText(
                    item.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (item.width<(400/3))? 10.5:14,
                        color: item.deepColor
                    ),
                    maxLines: 1,
                    minFontSize: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(3, 2, 3, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Text(
                    item.value_added.toString() + " %",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (item.width<(400/3))? 8:12,
                        color: Colors.amber
                    ),
                  )
                )
              ],
            )
          ),
          // Center(
          //   child: Padding(
          //     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          //     child: Text(
          //       item.description,
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 13.0,
          //           color: item.shadowColor
          //       ),
          //     ),
          //   )
          // ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: double.infinity,
              child: CustomContainer(
                child: Text(
                  item.price.toString() + '\$',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
                minHeight: 40,
              ),
            ),
          )
        ],
      ),
  );
}