import 'package:flutter/material.dart';
import 'package:common_lib/ui/ui.dart' as MyUI;
import 'package:common_lib/styles/color.dart';
import 'package:common_lib/extensions/color.dart';

void main() {
  Map<String, dynamic> jsonObject = {
    "primary_base": Colors.black.toHex(leadingHashSign: true)
  };

  ColorStyle.loadFromJson(jsonObject);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              MyUI.Form.textFormField(title: "Username", hint: "Ini Hint")
            ],
          ),
        ),
      )
    );
  }
}
