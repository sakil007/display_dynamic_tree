import 'package:display_dynamic_tree/dynamic_tree.dart';
import 'package:display_dynamic_tree/helper/constant.dart';
import 'package:display_dynamic_tree/helper/file_dao.dart';
import 'package:display_dynamic_tree/model/response_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dynamic Tree'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<ResponseModel> responseList = [];

  @override
  void initState() {
    super.initState();
    getResponse().then((value) {
      responseList.addAll(value);
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DynamicTreeScreen(
                            responseModelList: responseList,
                          )),
                );
              },
              child: Text("Go To Dynamic Tree view"))),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<ResponseModel>> getResponse() async {
    List<ResponseModel> items = [];
    Map<String, dynamic> jsonData =
        await FileDao.loadJsonFromAssets(AppConst.responseFileName);
    jsonData['items'].forEach((v) {
      items.add(ResponseModel.fromJson(v));
    });
    return items;
  }
}
