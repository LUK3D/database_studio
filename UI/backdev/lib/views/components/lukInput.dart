import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class lukInput extends StatelessWidget {
  final hint;

  final Function onChange;
  final Widget icon;
  const lukInput(
      {Key? key,
      required this.icon,
      required this.onChange,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        onChanged: (val) {
          onChange(val);
        },
        decoration: InputDecoration(
            icon: icon, border: InputBorder.none, hintText: hint),
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}
