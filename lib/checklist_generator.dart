library checklist_generator;

import 'package:flutter/material.dart';

import 'components/dynamic_page.dart';
import 'core/dynamic_process.dart';

class ChecklistGenerator {
  final BuildContext context;
  final DynamicChecklist dynamicChecklist;

  ChecklistGenerator({
    this.context,
    this.dynamicChecklist,
  });

  void start() {
    if (dynamicChecklist != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DynamicPage(
            dynamicChecklist: dynamicChecklist,
            checklistPage: dynamicChecklist.pages.first,
          ),
        ),
      );
    }
  }
}
