import 'package:dynamic_form_process/dynamic_process.dart';

class DynamicProcessFactory {
  static DynamicProcess mock() {
    return DynamicProcess(
      identifier: "asd-123123123",
      structure: Structure(pages: [
        Page(
          title: "Step 1",
          buttonTitle: "Step 2",
          stepGroups: [
            StepGroup(
              title: "Observaciones",
              steps: [
                ProcessStep(
                  label:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vel tellus sagittis, malesuada est vel, cursus velit. Donec eu turpis eget magna fringilla convallis a quis nisi. Cras vel condimentum dui. Vivamus a purus sit amet mauris porttitor aliquet. In sit amet orci risus. Nunc convallis massa diam, vel varius metus porttitor id. Curabitur mattis dui lectus, lacinia vehicula ligula elementum sit amet. Ut faucibus pretium cursus. Vestibulum id feugiat mi, vel varius neque. In auctor varius placerat. Phasellus non purus volutpat, dignissim eros vel, hendrerit diam",
                  isRequired: true,
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Observacion 2",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Observacion 3",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Observacion 4",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Observacion 5",
                  states: [
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Observacion 6",
                  states: [
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Observacion 3",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
              ],
            ),
            StepGroup(
              title: "Comentarios",
              steps: [
                ProcessStep(
                  label: "Comentario 1",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Comentario 2",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Comentario 3",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
              ],
            ),
          ],
        ),
        Page(
          title: "Step 2",
          buttonTitle: "Step 3",
          stepGroups: [
            StepGroup(
              title: "Observaciones",
              steps: [
                ProcessStep(
                  label: "1",
                  isRequired: true,
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "2",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "3",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Observacion 3",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
              ],
            ),
          ],
        ),
        Page(
          title: "Step 3",
          buttonTitle: "Finish",
          stepGroups: [
            StepGroup(
              title: "Observaciones",
              steps: [
                ProcessStep(
                  label: "Finish 1",
                  isRequired: true,
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Finish 2",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Finish 3",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
              ],
            ),
            StepGroup(
              title: "Review",
              steps: [
                ProcessStep(
                  label: "Review 1",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Review 2",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
                ProcessStep(
                  label: "Review 3",
                  states: [
                    StepState(stateType: StateType.pending),
                    StepState(stateType: StateType.inProgress),
                    StepState(stateType: StateType.finished),
                  ],
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
