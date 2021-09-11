import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/loading.dart';

class ReviewWords extends StatelessWidget {
  TextStyle _style({required Color color, required double size}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        // flexibleSpace: Text("sfdfddaf"),

        automaticallyImplyLeading: true,
        // leading: Text("Your Words!"),
        title: Row(
          children: [
            Expanded(
              child: Text("Review Words"),
              flex: 4,
            ),
            Expanded(
              child: Image.asset(ImageStrings.logoAsset),
            ),
          ],
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: secondBar(),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 1)),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.purple),
                        ),
                      ),
                      child: myRow(),
                    );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }

  myRow() {
    return Container(
      color: Colors.amber.shade200,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.purple),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "word1",
                    style: _style(color: Colors.black, size: 15),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.purple),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "word1",
                    style: _style(color: Colors.black, size: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  secondBar() {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.amber, width: 7),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Word",
                    style: _style(color: Colors.white, size: 20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.amber,width: 7),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Translation",
                    style: _style(color: Colors.white, size: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
