import 'package:flutter/material.dart';

class RankItem extends StatelessWidget {
  var userState;
  int index;

  RankItem(this.userState, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(20, 30),
          bottomRight: Radius.elliptical(20, 30),
        ),
        color: const Color(0xff17A0F2).withOpacity(0.2),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(20, 30),
                bottomRight: Radius.elliptical(20, 30),
              ),
              color: Colors.lightBlueAccent),
          child: Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/ranking/badge.png', width: 45.0),
                    Text(
                      userState.xp.toString(),
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(userState.name),
                flex: 6,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            userState.carrot.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            "assets/images/ranking/carrot2.png",
                            width: 35,
                          ),
                          right: -20,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // subtitle: Text(item.cups.toString()),
      ),
    );
  }
}
