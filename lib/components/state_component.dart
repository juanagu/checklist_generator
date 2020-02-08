import 'package:dynamic_form_process/dynamic_process.dart';
import 'package:flutter/material.dart';

class StateComponent extends StatelessWidget {
  final ProcessStep processStep;
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
