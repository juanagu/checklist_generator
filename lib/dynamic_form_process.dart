library dynamic_form_process;

import 'package:dynamic_form_process/dynamic_process.dart';
import 'package:flutter/material.dart';

import 'components/dynamic_page.dart';

class DynamicFormProcess {
  final BuildContext context;
  final DynamicProcess process;

  DynamicFormProcess({
    this.context,
    this.process,
  });

  void start() {
    if (process != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DynamicPage(
            process: process,
            page: process.structure.pages.first,
          ),
        ),
      );
    }
  }
}
