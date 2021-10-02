import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/slider/slider.dart';

class SettingsWidget extends StatelessWidget {
  SettingsWidget({Key? key}) : super(key: key);
  final AutoSizeGroup _group = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: [
      Card(
        color: Colors.amber,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: volumeWidget(
                  text: "Music",
                  asset: ImageStrings.gameHomeMusic2Asset,
                ),
              ),
              Flexible(
                child: volumeWidget(
                  text: "Effects",
                  asset: ImageStrings.gameHomeSound2Asset,
                ),
              ),
              Expanded(
                flex: 2,
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
            width: SizeConfig.blockSizeHorizontal*10,
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
        AutoSizeText(
          text,
          group: _group,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        SliderWidget(
          sliderHeight: SizeConfig.blockSizeVertical * 8 > 35
              ? 35
              : SizeConfig.blockSizeVertical * 8,
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          height: 5,
        ),
        Expanded(
          flex: 2,
          child: CustomContainer(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        "DONATE\nMONEY!",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        group: _group,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        ImageStrings.gameHomeShare1Asset,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        "Share\nRabbito!",
                        group: _group,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
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
