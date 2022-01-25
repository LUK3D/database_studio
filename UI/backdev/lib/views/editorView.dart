import 'package:backdev/controllers/EditorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabpanel/tabpanel.dart';

class EditorView extends StatelessWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(EditorController());

    return Column(
      children: [
        Container(
          color: Colors.blue,
          height: 50,
        ),
        Divider(
          height: 2,
          color: Colors.grey[100],
        ),
        Expanded(
          child: Container(
            child: Stack(
              children: [
                TabPanelWidget(_controller.makeMainPanel()),
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child: Card(
                //     child: IconButton(
                //       onPressed: () {
                //         _controller.darkMode.value =
                //             !_controller.darkMode.value;
                //       },
                //       icon: Icon(_controller.darkMode.value
                //           ? Icons.lightbulb
                //           : Icons.lightbulb_outlined),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
