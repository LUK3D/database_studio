import 'package:backdev/views/components/Flow/FlowUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlowCardController extends GetxController {
  var parentId;
  var size = Size(0, 0).obs;

  final GlobalKey myid = GlobalKey();

  FlowCardController({GlobalKey? this.parentId}) {
    this.parentId = parentId;
  }

  void showMetrics() {
    size.value = Size(
        myid.currentContext!.size!.width, myid.currentContext!.size!.height);

    print("SIZE: ${size.value} POSITION: ${myid}");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class Metrics {
  Size size = Size(0, 0);
  Rect globRect = Rect.fromLTRB(0, 0, 0, 0)
  var relativeRect;
  var left;
  var right;
  var top;
  var bottom;
  var wCenter;
  var hCenter;
  Metrics(GlobalKey key) {
    BuildContext ctx = key.currentContext!;
    size = ctx.size!;
    globRect = key.globalPaintBounds!;
    relativeRect = relativeRect;
    left = left;
    right = right;
    top = top;
    bottom = bottom;
    wCenter = wCenter;
    hCenter = hCenter;
  }
}
