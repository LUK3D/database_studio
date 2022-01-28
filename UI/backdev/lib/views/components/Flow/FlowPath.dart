import 'package:backdev/views/components/Flow/FlowPathController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class FlowPath extends StatelessWidget {
  var flow;
  FlowPath({
    Key? key,
    required FlowSide? this.flow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FlowPathController(), tag: Uuid().v4());

    if (flow == FlowSide.Right)
      return Positioned(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              "assets/icons/r_top.svg",
              width: 15 * 3,
              height: 15 * 3,
              semanticsLabel: 'sqlite',
            ),
            Positioned(
              child: SvgPicture.asset(
                "assets/icons/Dot.svg",
                width: 20,
                height: 20,
                semanticsLabel: 'sqlite',
              ),
              bottom: 35,
              left: -12,
            ),
            Positioned(
              child: SvgPicture.asset(
                "assets/icons/Dot.svg",
                width: 20,
                height: 20,
                semanticsLabel: 'sqlite',
              ),
              bottom: -9,
              right: -12,
            ),
          ],
        ),
        bottom: 0,
        right: -40,
      );
    if (flow == FlowSide.Left)
      return Positioned(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              "assets/icons/l_top.svg",
              width: 15 * 3,
              height: 15 * 3,
              semanticsLabel: 'sqlite',
            ),
            Positioned(
              child: SvgPicture.asset(
                "assets/icons/Dot.svg",
                width: 20,
                height: 20,
                semanticsLabel: 'sqlite',
              ),
              bottom: -9,
              left: -12,
            ),
            Positioned(
              child: SvgPicture.asset(
                "assets/icons/Dot.svg",
                width: 20,
                height: 20,
                semanticsLabel: 'sqlite',
              ),
              top: -9,
              right: -12,
            ),
          ],
        ),
        bottom: 49,
        left: -40,
      );
    return Positioned(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            "assets/icons/l_top.svg",
            width: 15 * 3,
            height: 15 * 3,
            semanticsLabel: 'sqlite',
          ),
          Positioned(
            child: SvgPicture.asset(
              "assets/icons/Dot.svg",
              width: 20,
              height: 20,
              semanticsLabel: 'sqlite',
            ),
            bottom: -9,
            left: -12,
          ),
          Positioned(
            child: SvgPicture.asset(
              "assets/icons/Dot.svg",
              width: 20,
              height: 20,
              semanticsLabel: 'sqlite',
            ),
            top: -9,
            right: -12,
          ),
        ],
      ),
      bottom: 49,
      left: -40,
    );
  }
}

enum FlowSide {
  Left,
  Top,
  Right,
  down,
}
