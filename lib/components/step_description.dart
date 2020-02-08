import 'package:dynamic_form_process/dynamic_process.dart';
import 'package:flutter/material.dart';

class StepDescription extends StatelessWidget {
  final ProcessStep processStep;

  const StepDescription({
    Key key,
    this.processStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      processStep.label,
      style: Theme.of(context).textTheme.body1,
    ));
  }
}
