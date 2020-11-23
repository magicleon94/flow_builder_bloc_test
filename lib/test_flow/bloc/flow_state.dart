part of 'flow_bloc.dart';

abstract class FlowState extends Equatable {
  @override
  List<Object> get props => [];
}

class FlowStepState extends FlowState {
  final bool feature1;
  final bool feature2;
  final bool feature3;

  FlowStepState({
    this.feature1,
    this.feature2,
    this.feature3,
  });

  FlowStepState copyWith({
    bool feature1,
    bool feature2,
    bool feature3,
  }) =>
      FlowStepState(
        feature1: feature1 ?? this.feature1,
        feature2: feature2 ?? this.feature2,
        feature3: feature3 ?? this.feature3,
      );
  @override
  List<Object> get props => [feature1, feature2, feature3];
}

class FlowStateCompleted extends FlowState {}
