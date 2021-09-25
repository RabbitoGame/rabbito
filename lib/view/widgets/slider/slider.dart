import 'package:flutter/material.dart';

import 'custom_slider_thumb_circle.dart';

class SliderWidget extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;
  final List gradientColors;
  final Color activeTickColor;
  final Color inactiveTickColor;
  final Color thumbColor;
  final Widget widget;

  SliderWidget({
    this.sliderHeight = 48,
    this.max = 10,
    this.min = 0,
    this.fullWidth = true,
    this.gradientColors = const <Color>[
      Color(0xFF00c6ff),
      Color(0xFF0072ff),
    ],
    this.activeTickColor = Colors.white,
    this.inactiveTickColor =  Colors.white,
    this.thumbColor = Colors.blue,
    required this.widget,
  });

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return Container(
      width: this.widget.fullWidth
          ? double.infinity
          : (this.widget.sliderHeight) * 5.5,
      height: (this.widget.sliderHeight),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
          Radius.circular((this.widget.sliderHeight * .3)),
        ),
        gradient: new LinearGradient(
            colors: (this.widget.gradientColors as List<Color>),
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.00),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(this.widget.sliderHeight * paddingFactor,
            2, this.widget.sliderHeight * paddingFactor, 2),
        child: Row(
          children: <Widget>[
            this.widget.widget,
            SizedBox(
              width: this.widget.sliderHeight * .1,
            ),
            Text(
              '${this.widget.min}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: this.widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: this.widget.sliderHeight * .1,
            ),
            Expanded(
              child: Center(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: this.widget.thumbColor,
                    // activeTrackColor: Colors.white.withOpacity(1),
                    // inactiveTrackColor: Colors.white.withOpacity(.5),
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                    trackHeight: 8.0,
                    thumbShape: CustomSliderThumbCircle(
                      thumbRadius: this.widget.sliderHeight * 0.4,
                      min: this.widget.min,
                      max: this.widget.max,

                    ),
                    overlayColor: Colors.white.withOpacity(.4),
                    activeTickMarkColor: this.widget.activeTickColor,
                    inactiveTickMarkColor: this.widget.inactiveTickColor.withOpacity(.7),
                  ),
                  child: Slider(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    divisions: 10,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: this.widget.sliderHeight * .1,
            ),
            Text(
              '${this.widget.max}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: this.widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
