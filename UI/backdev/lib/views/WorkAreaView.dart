import 'package:backdev/controllers/WorkAreaController.dart';
import 'package:backdev/views/paint/CurvedLine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphite/core/matrix.dart';
import 'package:graphite/graphite.dart';

class WorkAreaView extends StatelessWidget {
  const WorkAreaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(WorkAreaController());
    return Container(
      // child: CustomPaint(
      //   //
      //   size: Size(MediaQuery.of(context).size.width, 300),
      //   painter: CurvedLine(),
      // ),

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DirectGraph(
          list: nodeInputFromJson(_controller.presetBasic),
          cellWidth: 180,
          cellPadding: 24.0,
          orientation: MatrixOrientation.Horizontal,
          tipLength: 10,
          builder: (ctx, node) {
            return Container(
              width: 100,
              height: 50,
              color: Colors.transparent,
              child: Container(
                width: 80,
                height: 40,
                color: Colors.grey[800],
              ),
            );
          },
        ),
      ),
    );
  }
}
