import 'package:backdev/views/CodeEditorView.dart';
import 'package:backdev/views/ExplorerView.dart';
import 'package:backdev/views/ToolsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:backdev/tab_panel/tabpanel.dart';

class EditorController extends GetxController {
  var darkMode = false.obs;
  var childSizes = 200.0.obs;

  final leftPanel = TabPanel(defaultPage: ExplorerView());
  final rightPanel = TabPanel(defaultPage: ToolsView());
  final bottomPanel = TabPanel(defaultPage: CodeEditorView());
  final midlePanel = TabPanel(
      defaultPage: Container(
    color: Colors.grey[200],
  ));

  TabPanel makeMainPanel() {
    var tmpPanel = TabPanel(
        defaultPage: Container(),
        panels: [midlePanel, bottomPanel],
        axis: Axis.vertical);
    return TabPanel(
        defaultPage: ExplorerView(), panels: [leftPanel, tmpPanel, rightPanel]);
  }
}
