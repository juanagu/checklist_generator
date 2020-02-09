import 'dart:async';

import 'package:dynamic_form_process/core/dynamic_process.dart';

import 'checklist_step.dart';

abstract class DynamicChecklistListener {
  Future<void> onFinished(DynamicChecklist process);

  Future<void> onChangeProcessStep(ChecklistStep processStep);
}
