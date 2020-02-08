import 'package:flutter/material.dart';

import '../dynamic_process.dart';
import 'step_group_component.dart';

class DynamicPage extends StatefulWidget {
  final DynamicProcess process;
  final int pageNumber;

  DynamicPage({
    this.process,
    this.pageNumber,
  });

  @override
  State<StatefulWidget> createState() {
    return DynamicPageState(
      process: process,
      pageNumber: pageNumber,
    );
  }

  void openNewPage(BuildContext context, int pageNumber) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DynamicPage(
          process: process,
          pageNumber: pageNumber,
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
  int pageNumber;
  bool isComplete;

  DynamicPageState({
    this.process,
    this.pageNumber,
  }) {
    page = _getCurrentPage(process);
    isComplete = page.isValid();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page.title),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: _getGroups(context, page),
            ),
            MaterialButton(
              height: 60.0,
              onPressed: isComplete ? () => onPressedPageButton(context) : null,
              child: Text(isComplete ? page.buttonTitle : page.errorMessage),
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
      page = _getCurrentPage(newProcess);
      isComplete = page.isValid();
    });
  }

  Future<void> onPressedPageButton(BuildContext context) async {
    if (page.isValid()) {
      if (pageNumber < process.structure.pages.length - 1) {
        widget.openNewPage(context, pageNumber + 1);
      } else {
        await process.finished();
        widget.finished(context);
      }
    }
  }

  Page _getCurrentPage(DynamicProcess dynamicProcess) {
    return dynamicProcess.structure.pages[pageNumber];
  }
}
