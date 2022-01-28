import 'package:backdev/views/components/Flow/FlowCardController.dart';
import 'package:backdev/views/components/Flow/FlowPath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import 'package:uuid/uuid.dart';

class FlowCard extends StatelessWidget {
  Widget icon = HeroIcon(
    HeroIcons.viewGrid,
    size: 14,
  );
  String title = "Flow Title";
  double fontSize = 6.0;
  double width = 100;

  var parentId;

  var flow;

  var leftChild;
  var topChild;
  var rightChild;
  var bottomChild;

  var y;
  var x;

  var height;

  FlowCard({
    Key? key,
    Widget? icon,
    String? title,
    double? fontSize,
    double? width,
    double? height,
    double? verticalPosition,
    double? horizontalPosition,
    Widget? leftChild,
    Widget? topChild,
    Widget? rightChild,
    Widget? bottomChild,
    GlobalKey? parentId,
    FlowSide? flow,
  }) : super(key: key) {
    this.icon = icon ?? this.icon;
    this.title = title ?? this.title;
    this.fontSize = fontSize ?? this.fontSize;
    this.width = width ?? this.width;
    this.height = height;
    this.y = verticalPosition;
    this.x = horizontalPosition;
    this.leftChild = leftChild;
    this.topChild = topChild;
    this.rightChild = rightChild;
    this.bottomChild = bottomChild;
    this.flow = flow;
    this.parentId = parentId;
  }

  @override
  Widget build(BuildContext context) {
    var tag = Uuid().v4();
    final controller =
        Get.put(FlowCardController(parentId: parentId), tag: tag);

    return Positioned(
      key: controller.myid,
      top: y,
      right: x,
      child: Material(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3),
                    child: GestureDetector(
                      onTap: () {
                        controller.showMetrics();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          icon,
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.w700),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Just drop here your front-end framework from tools panel.",
                      style:
                          TextStyle(fontSize: 7, height: 1, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              FlowPath(
                flow: flow,
              ),
            ],
            clipBehavior: Clip.none,
          ),
        ),
        elevation: 4,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        clipBehavior: Clip.none,
      ),
    );
  }
}
