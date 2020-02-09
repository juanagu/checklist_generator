import 'package:flutter/material.dart';

import 'state_component.dart';
import 'step_description.dart';
import '../core/checklist_step.dart';

class StepComponent extends StatelessWidget {
  final ChecklistStep checklistStep;
  final Function onChanged;
  final Widget divider;
  final Function onPressedSubStep;
  final Function onPressedComment;

  const StepComponent({
    Key key,
    this.checklistStep,
    this.onChanged,
    this.onPressedSubStep,
    this.onPressedComment,
    this.divider = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = List<Widget>();
    body.add(StepDescription(
      processStep: checklistStep,
    ));

    if (checklistStep.canWriteAComment) {
      body.add(
        IconButton(
          icon: Icon(
            Icons.edit,
          ),
          onPressed: () => onPressedComment(context, checklistStep),
        ),
      );
    }

    if (!checklistStep.hasSubSteps()) {
      body.add(StateComponent(
        processStep: checklistStep,
        onChanged: onChanged,
      ));
    } else {
      body.add(
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
          ),
          onPressed: () => onPressedSubStep(checklistStep),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Row(
          children: body,
        ),
        divider,
      ],
    );
  }
}
