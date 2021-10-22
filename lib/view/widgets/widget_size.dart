import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rabbito/controller/app_controller.dart';
class WidgetSize extends StatefulWidget {
  final Widget child;

  const WidgetSize({

    required this.child,
  }) ;

  @override
  _WidgetSizeState createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;
    print("size= ${newSize!.height} ${newSize!.width}");
    AppController.appController.size = newSize;

  }
}