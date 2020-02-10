import 'package:flutter/material.dart';

class StepState {
  final int stateValue;
  final Color color;

  StepState({
    this.stateValue = 0,
    this.color,
  });

  Color getColorByStateType() {
    if (color != null) {
      return color;
    }

    switch (stateValue) {
      case 1:
        return Colors.orangeAccent;
      case 2:
        return Colors.deepPurpleAccent;
      case 3:
        return Colors.pinkAccent;
      case 4:
        return Colors.redAccent;
      default:
        return null;
    }
  }
}