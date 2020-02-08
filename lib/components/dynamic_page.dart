import 'package:flutter/material.dart';

import '../dynamic_process.dart';
import 'step_group_component.dart';

class DynamicPage extends StatefulWidget {
  final DynamicProcess process;
  final Page page;

  DynamicPage({
    this.process,
    this.page,
  });

  @override
  State<StatefulWidget> createState() {
    return DynamicPageState(
      process: process,
      page: page,
    );
  }

  void openNewPage(BuildContext context, Page page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DynamicPage(
          process: process,
          page: page,
        ),
      ),
    );
  }

  void finished(BuildContext context) {
    process.structure.pages.forEach((p) => Navigator.of(context).pop());
  }
}

class DynamicPageState extends State<DynamicPage> {
  DynamicProcess process;
  Page page;

  DynamicPageState({
    this.process,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return _buildPage(context, page);
  }

  Widget _buildPage(BuildContext context, Page page) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page.title),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: _getGroups(context, page),
            ),
            RaisedButton(
              onPressed: () => onPressedPageButton(context, page),
              child: Text(page.buttonTitle),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getGroups(BuildContext context, Page page) {
    var stepGroups = page.stepGroups;

    List<Widget> components = List();
    for (StepGroup stepGroup in stepGroups) {
      components.add(StepGroupComponent(
        stepGroup: stepGroup,
        onChangedStep: onChangedStep,
      ));
    }
    return components;
  }

  onChangedStep(bool value, ProcessStep processStep) async {
    var newProcess = await process.changeStateTo(processStep);
    setState(() {
      process = newProcess;
    });
  }

  Future<void> onPressedPageButton(BuildContext context, Page page) async {
    var indexOf = process.structure.pages.indexOf(page);
    if (indexOf >= 0 && indexOf < process.structure.pages.length - 1) {
      widget.openNewPage(context, process.structure.pages[indexOf + 1]);
    } else {
      await process.finished();
      widget.finished(context);
    }
  }
}
