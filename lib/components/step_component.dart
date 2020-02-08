import 'package:flutter/material.dart';

import '../dynamic_process.dart';
import 'state_component.dart';
import 'step_description.dart';

class StepComponent extends StatelessWidget {
  final ProcessStep processStep;
  final Function onChanged;
  final Widget divider;

  const StepComponent({
    Key key,
    this.processStep,
    this.onChanged,
    this.divider = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            StepDescription(
              processStep: processStep,
            ),
            StateComponent(
              processStep: processStep,
              onChanged: onChanged,
            ),
          ],
        ),
        divider,
      ],
    );
  }
}
