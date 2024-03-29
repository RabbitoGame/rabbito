import 'package:flutter/material.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

class BundleItem {

  late Color lightColor;
  late Color shadowColor;
  late Color deepColor;
  late double width;
  late double height;
  late String name;
  late String description;
  late String imageURL;
  late double price;
  late double last_price;
  late double discount_percentage;

  BundleItem({
    required this.deepColor,
    required this.shadowColor,
    required this.lightColor,
    required this.width,
    required this.height,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.price,
    required this.last_price,
    required this.discount_percentage
  });

}

Widget bundleCard(BundleItem item) {

  return Container(
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
    padding: EdgeInsets.fromLTRB(5, 2, 5, 3),
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
    child: Stack(
      children: [
        Column(
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
                    Text(
                      item.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: item.deepColor
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
                        child: Column(
                          children: [
                            Text(
                              item.price.toString() + '\$',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.blueAccent
                              ),
                            ),
                            Text(
                              item.last_price.toString() + '\$',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.amber
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                )
            ),
            Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    item.description,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:(item.width<400)? 10:13.5,
                        color: item.shadowColor
                    ),
                  ),
                )
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                width: double.infinity,
                child: CustomContainer(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {},
                  minHeight: 40,
                ),
              ),
            ),
          ],
        ),
        Positioned(
            top: 5,
            left: 5,
            child:  Container(
              padding: EdgeInsets.fromLTRB(3, 2, 3, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Text(
                item.discount_percentage.toString() + '%',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.red
                ),
              ),
            )
        )
      ],
    )
  );
}