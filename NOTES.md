7

Just ran into the same problem working on a drag-and-drop canvas in Flutter Web. I ended up working around this by inserting a GlobalKey for each of the draggable widgets and adjusting the placement offsets by accounting for the size of the containing renderbox (after waiting for the rendering to complete, via the addPostFrameCallback()). In order to facilitate precise placement, I used a Stack()/Positioned() and placed the Draggable() within this:

import 'package:flutter/material.dart';

class PositionedDraggableIcon extends StatefulWidget {
  final double top;
  final double left;

  PositionedDraggableIcon({Key key, this.top, this.left}) : super(key: key);

  @override
  _PositionedDraggableIconState createState() => _PositionedDraggableIconState();
}

class _PositionedDraggableIconState extends State<PositionedDraggableIcon> {
  GlobalKey _key = GlobalKey();
  double top, left;
  double xOff, yOff;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    top = widget.top;
    left = widget.left;
    super.initState();
  }

  void _getRenderOffsets() {
    final RenderBox renderBoxWidget = _key.currentContext.findRenderObject();
    final offset = renderBoxWidget.localToGlobal(Offset.zero);

    yOff = offset.dy - this.top;
    xOff = offset.dx - this.left;
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: _key,
      top: top,
      left: left,
      child: Draggable(
        child: Icon(Icons.input),
        feedback: Icon(Icons.input),
        childWhenDragging: Container(),
        onDragEnd: (drag) {
          setState(() {
            top = drag.offset.dy - yOff;
            left = drag.offset.dx - xOff;
          });
        },
      ),
    );
  }
}
It's probably possible to do this with the widget context itself and avoid the GlobalKey, but this works well enough for me.