import 'package:flutter/material.dart';

import 'dynamic_process_listener.dart';

class DynamicProcess {
  final String identifier;
  final Structure structure;
  final DynamicProcessListener dynamicProcessListener;

  DynamicProcess({
    this.identifier,
    this.structure,
    this.dynamicProcessListener,
  });

  Future<DynamicProcess> changeStateTo(ProcessStep processStep) async {
    processStep.change();
    if (dynamicProcessListener != null) {
      await dynamicProcessListener.onChangeProcessStep(processStep);
    }
    return this;
  }

  Future<void> finished() async {
    if (dynamicProcessListener != null) {
      await dynamicProcessListener.onFinished(this);
    }
    return true;
  }
}

class Structure {
  final List<Page> pages;

  Structure({this.pages});
}

class Page {
  final List<StepGroup> stepGroups;
  final bool isSequential;
  String title;
  String buttonTitle;
  String errorMessage;

  Page({
    this.stepGroups,
    this.title,
    this.isSequential = false,
    this.buttonTitle = "Next",
    this.errorMessage = "Complete all required steps.",
  });

  bool isValid() {
    for (var i = 0; i < stepGroups.length; i++) {
      var stepGroup = stepGroups[i];
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

class StepGroup {
  final List<ProcessStep> steps;
  final bool isSequential;
  String title;

  StepGroup({
    this.steps,
    this.title,
    this.isSequential = false,
  });
}

class ProcessStep {
  final String label;
  String description;

  final bool isRequired;
  List<StepState> states = [];
  StepState currentStepState;
  StepComment stepComment;

  ProcessStep({
    this.label,
    this.isRequired = false,
    this.states,
    this.currentStepState,
    this.stepComment,
    this.description,
  });

  void change() {
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

  bool isValid() {
    return !isRequired || currentStepState != null;
  }
}

class StepComment {
  final bool isRequired;
  String comment;

  StepComment({
    this.isRequired,
    this.comment,
  });
}

class StepState {
  final StateType stateType;
  final Color color;

  StepState({
    this.stateType,
    this.color,
  });

  Color getColorByStateType() {
    if (color != null) {
      return color;
    }

    switch (stateType) {
      case StateType.pending:
        return null;
      case StateType.pending:
        return Colors.orangeAccent;
      case StateType.inProgress:
        return Colors.deepPurpleAccent;
      case StateType.finished:
        return Colors.pinkAccent;
      case StateType.blocked:
        return Colors.redAccent;
      default:
        return null;
    }
  }
}

enum StateType { pending, inProgress, blocked, finished }
