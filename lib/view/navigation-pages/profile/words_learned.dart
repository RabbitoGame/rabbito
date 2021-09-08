import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

class WordsLearned extends StatelessWidget {
  int x;

  WordsLearned(this.x);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: ListTile(
              leading: Image.asset(ImageStrings.profileBookAsset),
              title: Text("YOU LEARNED $x WORDS!!!"),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              width: double.infinity,
              child: CustomContainer(
                child: Text(
                  "REVIEW WORDS!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
                outerColor: Colors.green,
                innerColor: Colors.lightGreen,
              ))
        ],
      ),
    );
  }
}
