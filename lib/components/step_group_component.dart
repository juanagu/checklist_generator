import 'package:dynamic_form_process/dynamic_process.dart';
import 'package:flutter/material.dart';

import 'header_step_group.dart';
import 'step_component.dart';

class StepGroupComponent extends StatelessWidget {
  final StepGroup stepGroup;
  final Function onChangedStep;

  const StepGroupComponent({
    Key key,
    this.stepGroup,
    this.onChangedStep,
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

  List<Widget> _getSteps(BuildContext context, List<ProcessStep> processSteps) {
    List<Widget> steps = List();
    for (ProcessStep processStep in processSteps) {
      steps.add(StepComponent(
        processStep: processStep,
        onChanged: onChangedStep,
      ));
    }
    return steps;
  }
}
