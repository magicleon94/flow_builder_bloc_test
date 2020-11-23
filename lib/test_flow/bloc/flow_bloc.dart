import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'flow_event.dart';
part 'flow_state.dart';

class FlowBloc extends Bloc<FlowEvent, FlowState> {
  FlowBloc() : super(FlowStepState());

  @override
  Stream<FlowState> mapEventToState(
    FlowEvent event,
  ) async* {
    if (event is FlowStep1Done) {
      yield FlowStepState(feature1: true);
    } else if (event is FlowStep2Done) {
      yield FlowStepState(feature1: true, feature2: true);
    } else if (event is FlowStep3Done) {
      yield FlowStateCompleted();
    }
  }
}
