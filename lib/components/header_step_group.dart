import 'package:flutter/material.dart';
import '../core/step_group.dart';

class HeaderStepGroup extends StatelessWidget {
  final StepGroup stepGroup;

  const HeaderStepGroup({
    Key key,
    this.stepGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        stepGroup.title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
