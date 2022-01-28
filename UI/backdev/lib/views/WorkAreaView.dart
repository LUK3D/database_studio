import 'package:backdev/controllers/WorkAreaController.dart';
import 'package:backdev/views/components/Flow/FlowCard.dart';
import 'package:backdev/views/components/Flow/FlowPath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkAreaView extends StatelessWidget {
  const WorkAreaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(WorkAreaController());
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[200],
      // child: CustomPaint(
      //   //
      //   size: Size(MediaQuery.of(context).size.width, 300),
      //   painter: CurvedLine(),
      // ),

      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello World",
                  style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                ),
                Text("Vamos mudar o mundo? 😉"),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: InteractiveViewer(
                maxScale: 200,
                minScale: 0.01,
                boundaryMargin: EdgeInsets.all(double.infinity),
                // boundaryMargin: EdgeInsets.all(40),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: DragTarget<Widget>(
                            onAccept: ((details) => {}),
                            builder: (ctx, list, list2) {
                              return this;
                            },
                          ),
                        ),
                        FlowCard(
                          width: 200,
                          height: 100,
                          icon: Icon(Icons.person),
                          title: "Cadastro",
                          flow: FlowSide.Right,
                        ),
                        FlowCard(
                          width: 200,
                          height: 100,
                          icon: Icon(Icons.person),
                          title: "Cadastro",
                          horizontalPosition: -230,
                          verticalPosition: -50,
                          flow: FlowSide.Left,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),

      // child: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   // child: DirectGraph(
      //   //   list: nodeInputFromJson(_controller.presetBasic),
      //   //   cellWidth: 180,
      //   //   cellPadding: 24.0,
      //   //   orientation: MatrixOrientation.Horizontal,
      //   //   tipLength: 10,
      //   //   builder: (ctx, node) {
      //   //     return Container(
      //   //       width: 100,
      //   //       height: 50,
      //   //       color: Colors.transparent,
      //   //       child: Container(
      //   //         width: 80,
      //   //         height: 40,
      //   //         color: Colors.grey[800],
      //   //       ),
      //   //     );
      //   //   },
      //   // ),
      // ),
    );
  }
}
