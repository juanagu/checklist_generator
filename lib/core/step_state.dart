import 'package:flutter/material.dart';

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
