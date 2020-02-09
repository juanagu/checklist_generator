import 'package:dynamic_form_process/components/single_comment_page.dart';
import 'package:flutter/material.dart';

import '../core/dynamic_process.dart';
import 'step_group_component.dart';
import '../core/checklist_page.dart';
import '../core/step_group.dart';
import '../core/checklist_step.dart';

class DynamicPage extends StatefulWidget {
  final DynamicChecklist process;
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

  void closeCurrentPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  void finished(BuildContext context) {
    process.pages.forEach((p) => closeCurrentPage(context));
  }
}

class DynamicPageState extends State<DynamicPage> {
  DynamicChecklist process;
  ChecklistPage page;
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

  List<Widget> _getGroups(BuildContext context, ChecklistPage page) {
    var stepGroups = page.checklistGroups;

    List<Widget> components = List();
    for (StepGroup stepGroup in stepGroups) {
      components.add(StepGroupComponent(
        stepGroup: stepGroup,
        onChangedStep: onChangedStep,
        onPressedSubStep: onPressedSubStep,
        onPressedComment: onPressedComment,
      ));
    }
    return components;
  }

  onChangedStep(bool value, ChecklistStep processStep) async {
    var newProcess = await process.changeStateTo(processStep);
    setState(() {
      process = newProcess;
      page = _getCurrentPage(newProcess);
      isComplete = page.isValid();
    });
  }

  onPressedSubStep(ChecklistStep checklistStep) {}

  onPressedComment(BuildContext context, ChecklistStep checklistStep) {
    if (checklistStep.canWriteMultiplesComments) {
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SingleCommentPage(
            title: checklistStep.label,
            onSaveComment: (comment) => print(comment),
          ),
        ),
      );
    }
  }

  Future<void> onPressedPageButton(BuildContext context) async {
    if (page.isValid()) {
      if (pageNumber < process.pages.length - 1) {
        widget.openNewPage(context, pageNumber + 1);
      } else {
        await process.finished();
        widget.finished(context);
      }
    }
  }

  ChecklistPage _getCurrentPage(DynamicChecklist dynamicProcess) {
    return dynamicProcess.pages[pageNumber];
  }
}
