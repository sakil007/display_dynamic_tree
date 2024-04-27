import 'package:display_dynamic_tree/model/response_model.dart';
import 'package:display_dynamic_tree/widgets/toplevel_widget.dart';
import 'package:flutter/material.dart';

class DynamicTreeScreen extends StatefulWidget {
  late List<ResponseModel> responseModelList;
  DynamicTreeScreen({super.key, required this.responseModelList});
  @override
  State<StatefulWidget> createState() {
    return _DynamicTreeState();
  }
}

class _DynamicTreeState extends State<DynamicTreeScreen> {
  late List<Widget> treeView = [];

  @override
  void initState() {
    super.initState();
    _buildDynamicTreeView(widget.responseModelList);
  }

  _buildDynamicTreeView(List<ResponseModel> list) {
    for (var value in list) {
      if (value.items.isNotEmpty) {
        treeView.add(TopLevelWidget(
          responseModel: value,
          children: _getButtomView(value.items),
        ));
      }
    }
  }

  _getButtomView(List<ResponseModel> list) {
    var widgetList = <Widget>[];
    for (var item in list) {
      if (item.items.isNotEmpty) {
        widgetList.add(TopLevelWidget(
          key: ObjectKey({"id": item.title}),
          responseModel: item,
          children: _getButtomView(item.items),
        ));
      } else {
        widgetList
            .add(ListTile(onTap: () {}, title: Text(item.title ?? "No title")));
      }
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dynamic Tree"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: treeView,
            ),
          ),
        ),
      ),
    );
  }
}
