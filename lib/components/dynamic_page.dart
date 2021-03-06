import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../core/dynamic_checklist.dart';
import 'single_comment_page.dart';
import 'step_group_component.dart';
import '../core/checklist_page.dart';
import '../core/step_group.dart';
import '../core/checklist_step.dart';

class DynamicPage extends StatefulWidget {
  final DynamicChecklist dynamicChecklist;
  final ChecklistPage checklistPage;
  final bool isSubPage;

  DynamicPage({
    this.dynamicChecklist,
    this.checklistPage,
    this.isSubPage = false,
  });

  @override
  State<StatefulWidget> createState() {
    return DynamicPageState(
      checklist: dynamicChecklist,
      checklistPage: checklistPage,
    );
  }

  void openNewPage(
      BuildContext context, ChecklistPage checklistPage, bool isSubPage) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DynamicPage(
          dynamicChecklist: dynamicChecklist,
          checklistPage: checklistPage,
          isSubPage: isSubPage,
        ),
      ),
    );
  }

  void closeCurrentPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  void finished(BuildContext context) {
    dynamicChecklist.pages.forEach((p) => closeCurrentPage(context));
  }
}

class DynamicPageState extends State<DynamicPage> {
  DynamicChecklist checklist;
  ChecklistPage checklistPage;
  bool isComplete;

  DynamicPageState({
    this.checklist,
    this.checklistPage,
  }) {
    isComplete = checklistPage.isValid();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(checklistPage.title),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => _buildMobileBody(context),
        desktop: (BuildContext context) => _buildDesktopBody(context),
      ),
    );
  }

  Widget _buildMobileBody(BuildContext context) {
    return Container(
      child: _buildBody(context),
    );
  }

  Widget _buildDesktopBody(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: _getGroups(context, checklistPage),
        ),
        MaterialButton(
          height: 60.0,
          onPressed: isComplete ? () => onPressedPageButton(context) : null,
          child: Text(isComplete
              ? checklistPage.buttonTitle
              : checklistPage.errorMessage),
        ),
      ],
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
    var newChecklist = await checklist.changeStateTo(processStep);
    refreshStateWithNewChecklistState(newChecklist);
  }

  void refreshStateWithNewChecklistState(DynamicChecklist newChecklist) {
    setState(() {
      checklist = newChecklist;
      isComplete = checklistPage.isValid();
    });
  }

  onPressedSubStep(ChecklistStep checklistStep) {
    widget.openNewPage(context, checklistStep.subSteps, true);
  }

  onPressedComment(BuildContext context, ChecklistStep checklistStep) {
    if (checklistStep.canWriteMultiplesComments) {
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SingleCommentPage(
            title: checklistStep.label,
            comment: checklistStep.getLastComment(),
            checklistStep: checklistStep,
            onSaveComment: onSaveComment,
          ),
        ),
      );
    }
  }

  Future<void> onPressedPageButton(BuildContext context) async {
    if (checklistPage.isValid()) {
      if (!widget.isSubPage) {
        await nextAction(context);
      } else {
        widget.closeCurrentPage(context);
      }
    }
  }

  Future nextAction(BuildContext context) async {
    var pageNumber = checklist.pages.indexOf(checklistPage);
    if (pageNumber < checklist.pages.length - 1) {
      widget.openNewPage(context, checklist.pages[pageNumber + 1], false);
    } else {
      await checklist.finished();
      widget.finished(context);
    }
  }

  void onSaveComment(ChecklistStep checklistStep, String comment) async {
    checklistStep.updateComment(comment);
    var newChecklist = await checklist.update(checklistStep);
    refreshStateWithNewChecklistState(newChecklist);
  }
}
