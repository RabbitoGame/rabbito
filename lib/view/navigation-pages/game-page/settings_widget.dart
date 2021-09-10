import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/slider/slider.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        color: Colors.amber,

        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              volumeWidget(
                text: "Music",
                asset: ImageStrings.gameHomeMusic2Asset,
              ),
              volumeWidget(
                text: "Effects",
                asset: ImageStrings.gameHomeSound2Asset,
              ),
              supportWidget(),
            ],
          ),
        ),
      ),
      Align(
        child: InkWell(
          child: Image.asset(
            ImageStrings.gameHomeClose2Asset,
            width: 50,
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        alignment: Alignment.topRight,
      ),
    ]);
  }

  volumeWidget({required text, required asset}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        SliderWidget(
          widget: Image.asset(asset),
          gradientColors: <Color>[
            Colors.orangeAccent,
            Colors.orange,
          ],
          thumbColor: Colors.orange,
        ),
      ],
    );
  }

  supportWidget() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  "Support Rabitto!!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: Image.asset(ImageStrings.logoAsset)),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CustomContainer(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(ImageStrings.gameHomeDonationsAsset),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "DONATE\nMONEY!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          innerColor: Colors.deepOrange,
          outerColor: Colors.red,
        ),
        SizedBox(
          height: 10,
        ),
        CustomContainer(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(ImageStrings.gameHomeShare1Asset,),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Share\nRabbito!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          innerColor: Colors.deepOrange,
          outerColor: Colors.red,
        ),
      ],
    );
  }
}
