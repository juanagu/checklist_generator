import 'package:flutter/material.dart';

import 'header_step_group.dart';
import 'step_component.dart';
import '../core/step_group.dart';
import '../core/checklist_step.dart';

class StepGroupComponent extends StatelessWidget {
  final StepGroup stepGroup;
  final Function onChangedStep;
  final Function onPressedSubStep;
  final Function onPressedComment;

  const StepGroupComponent({
    Key key,
    this.stepGroup,
    this.onChangedStep,
    this.onPressedSubStep,
    this.onPressedComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: <Widget>[
              HeaderStepGroup(
                stepGroup: stepGroup,
              ),
              Column(
                children: _getSteps(context, stepGroup.steps),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getSteps(
      BuildContext context, List<ChecklistStep> processSteps) {
    List<Widget> steps = List();
    for (ChecklistStep processStep in processSteps) {
      steps.add(StepComponent(
        checklistStep: processStep,
        onChanged: onChangedStep,
        onPressedSubStep: onPressedSubStep,
        onPressedComment: onPressedComment,
      ));
    }
    return steps;
  }
}
