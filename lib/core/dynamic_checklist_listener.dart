import 'dart:async';

import 'checklist_step.dart';
import 'dynamic_checklist.dart';

abstract class DynamicChecklistListener {
  Future<void> onFinished(DynamicChecklist process);

  Future<void> onChangeChecklistStep(ChecklistStep processStep);
}
