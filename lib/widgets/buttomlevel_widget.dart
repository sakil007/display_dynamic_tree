import 'package:flutter/material.dart';

class ButtomWidget extends StatefulWidget {
  final List<Widget> children;
  final bool isExpand;
  ButtomWidget({required this.children, this.isExpand = false});

  @override
  _ButtomWidgetState createState() => _ButtomWidgetState();
}

class _ButtomWidgetState extends State<ButtomWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.children.map((item) {
      return widget.isExpand
          ? Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: item,
              ))
          : const SizedBox();
    }).toList());
  }
}
