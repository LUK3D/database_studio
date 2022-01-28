import 'package:backdev/views/components/Flow/FlowUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlowCardController extends GetxController {
  var parentId;
  var size = Size(0, 0).obs;

  Rx<Metrics>? metrics;

  var x = 0.0.obs;
  var y = 0.0.obs;

  final GlobalKey myid = GlobalKey();

  FlowCardController(
      {GlobalKey? parentId, this.metrics, double? x = 0, double? y = 0}) {
    parentId = parentId;
  }

  void showMetrics(x, y) {
    this.metrics = new Metrics(myid).obs;

    this.metrics!.value.right = x;
    this.metrics!.value.top = y;

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
  Rect globRect = Rect.fromLTRB(0, 0, 0, 0);
  var relativeRect;
  var left;
  var right;
  var top;
  var bottom;
  var wCenter;
  var hCenter;
  Metrics(GlobalKey key) {
    BuildContext ctx = Get.context!;
    size = ctx.size!;
    globRect = key.globalPaintBounds!;
    relativeRect = ctx.findRenderObject()!.paintBounds;
    left = ctx.findRenderObject()!.paintBounds.left;
    right = ctx.findRenderObject()!.paintBounds.right;
    top = ctx.findRenderObject()!.paintBounds.top;
    bottom = ctx.findRenderObject()!.paintBounds.bottom;
    wCenter = ctx.findRenderObject()!.paintBounds.width / 2;
    hCenter = ctx.findRenderObject()!.paintBounds.height / 2;
  }
}
