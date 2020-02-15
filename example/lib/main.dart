import 'package:checklist_generator/checklist_generator.dart';
import 'package:flutter/material.dart';

import 'samples/dynamic_process_factory.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Init Check List"),
          onPressed: () => ChecklistGenerator(
            context: context,
            dynamicChecklist: ChecklistFactory.createSample(),
          ).start(),
        ),
      ),
    );
  }
}
