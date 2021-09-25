import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
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
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.purple,
                automaticallyImplyLeading: true,
                // expandedHeight: 200.0,
                floating: false,
                pinned: true,
                title: Container(
                  child: Row(
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
              ),
              SliverList(
                delegate: new SliverChildListDelegate([secondBar()]),
              ),
            ];
          },
          body: FutureBuilder(
            future: Future.delayed(Duration(seconds: 1)),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingWidget(Indicator.ballPulse);
              } else {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return ListView.builder(
                    // shrinkWrap: true,
                    itemCount: 100,
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
      color: Colors.deepOrangeAccent,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.amber, width: 3),
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
                  left: BorderSide(color: Colors.amber, width: 3),
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
