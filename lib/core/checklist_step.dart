import 'package:dynamic_form_process/core/checklist_page.dart';

import 'step_comment.dart';
import 'step_state.dart';

class ChecklistStep {
  final String label;
  String description;
  final bool isRequired;

  List<StepState> states = [];
  StepState currentStepState;

  List<StepComment> stepComments = [];
  final bool isCommentRequired;
  final bool canWriteMultiplesComments;
  final bool canWriteAComment;

  ChecklistPage subSteps;

  ChecklistStep({
    this.label,
    this.isRequired = false,
    this.states,
    this.currentStepState,
    this.stepComments,
    this.description,
    this.isCommentRequired = false,
    this.canWriteAComment = false,
    this.canWriteMultiplesComments = false,
    this.subSteps,
  });

  void changeState() {
    if (states != null && states.isNotEmpty) {
      if (currentStepState == null) {
        currentStepState = states.first;
      } else {
        var indexOf = states.indexOf(currentStepState);
        if (indexOf >= states.length - 1) {
          currentStepState = null;
        } else {
          currentStepState = states[indexOf + 1];
        }
      }
    }
  }

  void updateComment(String newComment) {
    if (canWriteAComment) {
      if (canWriteMultiplesComments ||
          stepComments == null ||
          stepComments.isEmpty) {
        if (stepComments == null) {
          stepComments = [];
        }
        stepComments.add(StepComment(
          comment: newComment,
          dateTime: DateTime.now(),
        ));
      } else {
        var existComment = stepComments.first;
        existComment.dateTime = DateTime.now();
        existComment.comment = newComment;
        stepComments.insert(0, existComment);
      }
    }
  }

  bool isValid() {
    if (!hasSubSteps()) {
      return !isRequired || currentStepState != null;
    }

    return subSteps.isValid();
  }

  bool hasSubSteps() {
    return subSteps != null;
  }

  String getLastComment() {
    if (stepComments == null || stepComments.isEmpty) {
      return null;
    }

    return stepComments.last.comment;
  }

  bool hasAComment() {
    var lastComment = getLastComment();
    return lastComment != null && lastComment.isNotEmpty;
  }
}
