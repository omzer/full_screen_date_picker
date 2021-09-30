import 'package:flutter/material.dart';

class CircleAround extends StatelessWidget {
  final Widget child;

  CircleAround({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: Colors.blue),
      ),
    );
  }
}
