import 'checklist_page.dart';
import 'checklist_step.dart';
import 'dynamic_process_listener.dart';

class DynamicChecklist {
  final String identifier;
  final List<ChecklistPage> pages;
  final DynamicChecklistListener dynamicChecklistListener;

  DynamicChecklist({
    this.identifier,
    this.pages,
    this.dynamicChecklistListener,
  });

  Future<DynamicChecklist> changeStateTo(ChecklistStep checklistStep) async {
    checklistStep.changeState();
    if (dynamicChecklistListener != null) {
      await dynamicChecklistListener.onChangeChecklistStep(checklistStep);
    }
    return this;
  }

  Future<void> finished() async {
    if (dynamicChecklistListener != null) {
      await dynamicChecklistListener.onFinished(this);
    }
    return true;
  }

  Future<DynamicChecklist> update(ChecklistStep checklistStep) async {
    if (dynamicChecklistListener != null) {
      await dynamicChecklistListener.onChangeChecklistStep(checklistStep);
    }
    return this;
  }
}
