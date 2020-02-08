import 'dart:async';

import 'package:dynamic_form_process/dynamic_process.dart';

abstract class DynamicProcessListener{

  Future<void> onFinished(DynamicProcess process);

  Future<void> onChangeProcessStep(ProcessStep processStep);
}