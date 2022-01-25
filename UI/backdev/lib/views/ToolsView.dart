import 'package:flutter/material.dart';
import 'package:tabpanel/tabpanel.dart';

class ToolsView extends StatelessWidget with TabPageMixin {
  @override
  final String title = 'Tools';

  @override
  final IconData iconData = Icons.grid_view_outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("FERRAMENTAS"),
      ),
    );
  }
}
