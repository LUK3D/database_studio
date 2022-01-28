import 'package:flutter/material.dart';

void main() => runApp(
      new MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable',
      home: Drag(),
    );
  }
}

class Drag extends StatefulWidget {
  Drag({Key? key}) : super(key: key);
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  double top = 0;
  double left = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Draggable(
          child: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: DragItem(),
          ),
          feedback: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: DragItem(),
          ),
          childWhenDragging: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: DragItem(),
          ),
          onDragCompleted: () {},
          onDragEnd: (drag) {
            setState(() {
              top = top + drag.offset.dy < 0 ? 0 : top + drag.offset.dy;
              left = left + drag.offset.dx < 0 ? 0 : left + drag.offset.dx;
            });
          },
        ),
      ),
    );
  }
}

class DragItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(57744, fontFamily: 'MaterialIcons'),
      size: 36,
    );
  }
}
