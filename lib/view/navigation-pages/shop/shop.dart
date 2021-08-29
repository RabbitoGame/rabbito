import 'package:flutter/material.dart';

class Product {
  String name, price, image;
  bool userLiked;
  double discount;

  Product(
      {required this.name,
      required this.price,
      required this.discount,
      required this.image,
      required this.userLiked});
}

Widget cardItem(Product food,
    {required double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 180,
    height: 180,
    // color: Colors.red,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
        Container(
            width: 180,
            height: 180,
            child: RaisedButton(
                color: Colors.white,
                elevation: (isProductPage) ? 20 : 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: onTapped,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: food.name,
                    child: Image.asset(food.image,
                        width: (imgWidth != null) ? imgWidth : 100)))),
        Positioned(
          bottom: (isProductPage) ? 10 : 70,
          right: 0,
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape: CircleBorder(),
            onPressed: onLike,
            child: Icon(
              (food.userLiked) ? Icons.favorite : Icons.favorite_border,
              color: (food.userLiked) ? Colors.deepOrange : Colors.orangeAccent,
              size: 30,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food.name),
                    Text(food.price),
                  ],
                )
              : Text(' '),
        ),
        Positioned(
            top: 10,
            left: 10,
            child: (food.discount != null)
                ? Container(
                    padding:
                        EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(50)),
                    child: Text('-' + food.discount.toString() + '%',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                  )
                : SizedBox(width: 0))
      ],
    ),
  );
}

Widget shopMenu(BuildContext context) {
  // will pick it up from here
  // am to start another template
  List<Product> foods = [
    Product(
        name: "Card",
        image: "assets/images/introduction/welcome1.png",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Card",
        image: "assets/images/introduction/welcome2.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Card",
      image: "assets/images/introduction/welcome3.png",
      price: '\$10.99',
      userLiked: false,
      discount: 0,
    ),
    Product(
        name: "Card",
        image: "assets/images/introduction/welcome4.png",
        price: '\$50.00',
        userLiked: true,
        discount: 14)
  ];

  List<Product> drinks = [
    Product(
        name: "Card",
        image: "assets/images/appbar/coin.png",
        price: "\$45.12",
        userLiked: true,
        discount: 2),
    Product(
        name: "Card",
        image: "assets/images/appbar/cup.png",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Card",
        image: "assets/images/appbar/heart.png",
        price: "\$78.99",
        userLiked: false,
        discount: 0),
    Product(
        name: "Card",
        image: "assets/images/navigation/ranking.png",
        price: "\$168.99",
        userLiked: true,
        discount: 3.4)
  ];

  return ListView(children: <Widget>[
    headerTopCategories(),
    deals('Hot Things', onViewMore: () {}, items: <Widget>[
      cardItem(foods[0], onTapped: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return new ProductPage(
        //         productData: foods[0],
        //       );
        //     },
        //   ),
        // );
      }, onLike: () {}, imgWidth: 40),
      cardItem(foods[1], onTapped: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return new ProductPage(
        //         productData: foods[1],
        //       );
        //     },
        //   ),
        // );
      }, imgWidth: 250, onLike: () {}),
      cardItem(foods[2], onTapped: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return new ProductPage(
        //         productData: foods[2],
        //       );
        //     },
        //   ),
        // );
      }, imgWidth: 200, onLike: () {}),
      cardItem(foods[3], onTapped: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return new ProductPage(
        //         productData: foods[3],
        //       );
        //     },
        //   ),
        // );
      }, onLike: () {}, imgWidth: 40),
    ]),
    deals('Cards', onViewMore: () {}, items: <Widget>[
      cardItem(drinks[0], onTapped: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) {
        //         return new ProductPage(
        //           productData: drinks[0],
        //         );
        //       },
        //     ),
        //   );
      }, onLike: () {}, imgWidth: 60),
      cardItem(drinks[1], onTapped: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return new ProductPage(
        //         productData: drinks[1],
        //       );
        //     },
        //   ),
        // );
      }, onLike: () {}, imgWidth: 75),
      cardItem(drinks[2], onTapped: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return new ProductPage(
        //         productData: drinks[2],
        //       );
        //     },
        //   ),
        // );
      }, imgWidth: 110, onLike: () {}),
      cardItem(drinks[3], onTapped: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return new ProductPage(
        //         productData: drinks[3],
        //       );
        //     },
        //   ),
        // );
      }, onLike: () {}, imgWidth: 40),
    ])
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›'),
        ),
      )
    ],
  );
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('All Categories', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            headerCategoryItem('Cards', Icons.credit_card, onPressed: () {}),
            headerCategoryItem('Scores', Icons.score, onPressed: () {}),
            headerCategoryItem('Colors', Icons.color_lens, onPressed: () {}),
            headerCategoryItem('Games', Icons.videogame_asset,
                onPressed: () {}),
            headerCategoryItem('Games', Icons.games_outlined, onPressed: () {}),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: Colors.white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›')
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, required List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.'),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}
