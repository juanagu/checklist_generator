import 'step_group.dart';

class ChecklistPage {
  final List<StepGroup> checklistGroups;
  final bool isSequential;
  String title;
  String buttonTitle;
  String errorMessage;

  ChecklistPage({
    this.checklistGroups,
    this.title,
    this.isSequential = false,
    this.buttonTitle = "Next",
    this.errorMessage = "Complete all required steps.",
  });

  bool isValid() {
    for (var i = 0; i < checklistGroups.length; i++) {
      var stepGroup = checklistGroups[i];
      for (var j = 0; j < stepGroup.steps.length; j++) {
        var step = stepGroup.steps[j];
        if (!step.isValid()) {
          return false;
        }
      }
    }
    return true;
  }
}
