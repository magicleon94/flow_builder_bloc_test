part of 'flow_bloc.dart';

abstract class FlowEvent extends Equatable {
  const FlowEvent();

  @override
  List<Object> get props => [];
}

class FlowStep1Done extends FlowEvent {}

class FlowStep2Done extends FlowEvent {}

class FlowStep3Done extends FlowEvent {}
