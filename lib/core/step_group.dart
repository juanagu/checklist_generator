import 'checklist_step.dart';

class StepGroup {
  final List<ChecklistStep> steps;
  final bool isSequential;
  String title;

  StepGroup({
    this.steps,
    this.title,
    this.isSequential = false,
  });
}
