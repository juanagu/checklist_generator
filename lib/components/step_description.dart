import 'package:flutter/material.dart';
import '../core/checklist_step.dart';

class StepDescription extends StatelessWidget {
  final ChecklistStep processStep;

  const StepDescription({
    Key key,
    this.processStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (processStep.description == null || processStep.description.isEmpty) {
      return Expanded(child: _buildLabel(context));
    }

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: _buildLabel(context),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4.0,
            ),
            child: Text(
              processStep.description,
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: processStep.label,
            style: Theme.of(context).textTheme.body1,
          ),
          TextSpan(
            text: processStep.isRequired ? "" : "(Optional)",
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
