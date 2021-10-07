import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/slider/slider.dart';

class SettingsWidget extends StatelessWidget {
  SettingsWidget({Key? key}) : super(key: key);
  final AutoSizeGroup _group = AutoSizeGroup();
  var radius;

  var lowPadding;

  var highPadding;

  var backButtonSize;

  @override
  Widget build(BuildContext context) {
    radius = SizeConfig.blockSizeHorizontal * 1;
    lowPadding = SizeConfig.blockSizeHorizontal * 1;
    highPadding = SizeConfig.blockSizeHorizontal * 3;
    backButtonSize = SizeConfig.blockSizeHorizontal * 12;
    SizeConfig().init(context);
    return Stack(children: [
      Card(
        color: Colors.amber,
        child: Container(
          padding: EdgeInsets.all(highPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: volumeWidget(
                  text: "Music",
                  asset: ImageStrings.gameHomeMusic2Asset,
                ),
              ),
              Spacer(),
              Expanded(
                flex: 3,
                child: volumeWidget(
                  text: "Effects",
                  asset: ImageStrings.gameHomeSound2Asset,
                ),
              ),
              Spacer(),
              Expanded(
                flex: 7,
                child: supportWidget(),
              ),
            ],
          ),
        ),
      ),
      Align(
        child: InkWell(
          child: Image.asset(
            ImageStrings.gameHomeClose2Asset,
            width: SizeConfig.blockSizeHorizontal * 10,
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
        Expanded(
          child: AutoSizeText(
            text,
            group: _group,
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: SliderWidget(
            infiniteHeight: true,
            widget: Image.asset(asset),
            gradientColors: <Color>[
              Colors.orangeAccent,
              Colors.orange,
            ],
            thumbColor: Colors.orange,
          ),
        ),
      ],
    );
  }

  supportWidget() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: lowPadding),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: AutoSizeText(
                    "Support Rabitto!!",
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Image.asset(ImageStrings.logoAsset)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: lowPadding,
        ),
        Expanded(
          flex: 2,
          child: CustomContainer(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.all(lowPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(lowPadding),
                      child: Image.asset(ImageStrings.gameHomeDonationsAsset),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(lowPadding),
                      child: AutoSizeText(
                        "DONATE\nMONEY!",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        group: _group,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            innerColor: Colors.deepOrange,
            outerColor: Colors.red,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          flex: 2,
          child: CustomContainer(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.all(lowPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(lowPadding),
                      child: Image.asset(
                        ImageStrings.gameHomeShare1Asset,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(lowPadding),
                      child: AutoSizeText(
                        "Share\nRabbito!",
                        group: _group,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            innerColor: Colors.deepOrange,
            outerColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
