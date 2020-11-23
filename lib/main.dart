import 'package:flow_builder_bloc_test/test_flow/test_flow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlowBuilder bloc test',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlowBuilder bloc test'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Begin'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                settings: RouteSettings(name: 'testFlow'),
                builder: (context) => TestFlow(),
              ),
            );
          },
        ),
      ),
    );
  }
}
