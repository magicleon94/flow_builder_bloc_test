import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'flow_event.dart';
part 'flow_state.dart';

class FlowBloc extends Bloc<FlowEvent, FlowState> {
  final _history = <FlowStepState>[];
  FlowBloc() : super(FlowStepState());

  @override
  void onTransition(Transition<FlowEvent, FlowState> transition) {
    if (!(transition.event is FlowStepPop) &&
        (transition.currentState is FlowStepState)) {
      _history.add(transition.currentState);
    }
    super.onTransition(transition);
  }

  @override
  Stream<FlowState> mapEventToState(
    FlowEvent event,
  ) async* {
    if (event is FlowStepPop) {
      yield _undoStep();
    }
    if (event is FlowStep1Done) {
      yield FlowStepState(feature1: true);
    } else if (event is FlowStep2Done) {
      yield FlowStepState(feature1: true, feature2: true);
    } else if (event is FlowStep3Done) {
      yield FlowStateCompleted();
    }
  }

  FlowState _undoStep() {
    if (state is FlowStepState) {
      return _history.removeLast();
    } else {
      return state;
    }
  }
}
