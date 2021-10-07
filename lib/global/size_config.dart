import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;
  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;

  static late double radius1;
  static late double radius2;
  static late double radius3;
  static late double padding1;
  static late double padding2;
  static late double padding3;
  static late double iconWidth1;
  static late double iconWidth2;
  static late double iconWidth3;
  static late double width1;
  static late double width2;
  static late double width3;
  static late double height1;
  static late double height2;
  static late double height3;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    radius1 = blockSizeHorizontal * 1;
    radius2 = blockSizeHorizontal * 3;
    radius3 = blockSizeHorizontal * 5;
    padding1 = SizeConfig.blockSizeHorizontal * 1;
    padding2 = SizeConfig.blockSizeHorizontal * 3;
    padding3 = SizeConfig.blockSizeHorizontal * 5;

    iconWidth1 = SizeConfig.blockSizeHorizontal * 5;
    iconWidth2 = SizeConfig.blockSizeHorizontal * 10;
    iconWidth3 = SizeConfig.blockSizeHorizontal * 15;
    height1 = SizeConfig.blockSizeVertical * 10;
    height2 = SizeConfig.blockSizeVertical * 15;
    height3 = SizeConfig.blockSizeVertical * 25;
  }
}
