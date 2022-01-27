import 'dart:async';

import 'package:backdev/views/CodeEditorView.dart';
import 'package:backdev/views/ExplorerView.dart';
import 'package:backdev/views/ToolsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:backdev/tab_panel/tabpanel.dart';
import 'package:xterm/frontend/terminal_view.dart';
import 'package:xterm/theme/terminal_theme.dart';
import 'package:xterm/xterm.dart';

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

  void onInput(String input) {
    print('input: $input');
  }

  Widget AddTerminal() {
    final terminal = Terminal(
      backend: FakeTerminalBackend(),
      maxLines: 10000,
    );

    return TerminalView(
      terminal: terminal,
      style: TerminalStyle(
        fontFamily: ['Cascadia Mono'],
      ),
    );
  }

  TabPanel makeMainPanel() {
    var tmpPanel = TabPanel(
        defaultPage: Container(),
        panels: [midlePanel, bottomPanel],
        axis: Axis.vertical);

    bottomPanel.pushPage(page: AddTerminal(), forceNewTab: true);

    return TabPanel(
        defaultPage: ExplorerView(), panels: [leftPanel, tmpPanel, rightPanel]);
  }
}

class FakeTerminalBackend extends TerminalBackend {
  final _exitCodeCompleter = Completer<int>();
  // ignore: close_sinks
  final _outStream = StreamController<String>();

  @override
  Future<int> get exitCode => _exitCodeCompleter.future;

  @override
  void init() {
    _outStream.sink.add('Backdev demo');
    _outStream.sink.add('\r\n');
    _outStream.sink.add('LUK3D-> ');
  }

  @override
  Stream<String> get out => _outStream.stream;

  @override
  void resize(int width, int height, int pixelWidth, int pixelHeight) {
    // NOOP
  }

  @override
  void write(String input) {
    if (input.length <= 0) {
      return;
    }
    // in a "real" terminal emulation you would connect onInput to the backend
    // (like a pty or ssh connection) that then handles the changes in the
    // terminal.
    // As we don't have a connected backend here we simulate the changes by
    // directly writing to the terminal.
    if (input == '\r') {
      _outStream.sink.add('\r\n');
      _outStream.sink.add('LUK3D-> ');
    } else if (input.codeUnitAt(0) == 127) {
      // Backspace handling
      if (input.toString().toUpperCase() != "LUK3D-> ")
        _outStream.sink.add('\b \b');
    } else {
      _outStream.sink.add(input);
    }
  }

  @override
  void terminate() {
    //NOOP
  }

  @override
  void ackProcessed() {
    //NOOP
  }
}
