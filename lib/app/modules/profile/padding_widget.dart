import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  final Widget child;
  final String title;

  const PaddingWidget(
      {Key? key, this.title = "PaddingWidget", required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: child,
    );
  }
}
