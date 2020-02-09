import 'package:flutter/material.dart';
import '../core/checklist_step.dart';

class StateComponent extends StatelessWidget {
  final ChecklistStep processStep;
  final Function onChanged;

  const StateComponent({
    Key key,
    this.processStep,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      tristate: true,
      activeColor: processStep.currentStepState != null
          ? processStep.currentStepState.getColorByStateType()
          : Colors.redAccent,
      value: processStep.currentStepState != null,
      onChanged: (value) => onChanged(value, processStep),
    );
  }
}
