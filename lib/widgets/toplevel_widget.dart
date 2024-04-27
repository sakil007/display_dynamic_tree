import 'package:display_dynamic_tree/model/response_model.dart';
import 'package:display_dynamic_tree/widgets/buttomlevel_widget.dart';
import 'package:flutter/material.dart';

class TopLevelWidget extends StatefulWidget {
  final ResponseModel responseModel;
  final List<Widget> children;

  const TopLevelWidget(
      {super.key, required this.responseModel, required this.children});

  @override
  _TopLevelWidgetState createState() => _TopLevelWidgetState();
}

class _TopLevelWidgetState extends State<TopLevelWidget> {
  bool isExpand = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(widget.responseModel.title ?? ""),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                isExpand = !isExpand;
              });
            },
            icon: Icon(
                isExpand ? Icons.arrow_drop_down_outlined : Icons.arrow_right),
          ),
        ),
        ButtomWidget(
          isExpand: isExpand,
          children: widget.children,
        )
      ],
    );
  }
}
