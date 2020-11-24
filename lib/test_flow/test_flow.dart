import 'package:flow_builder/flow_builder.dart';
import 'package:flow_builder_bloc_test/test_flow/bloc/flow_bloc.dart';
import 'package:flow_builder_bloc_test/test_flow/test_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestFlow extends StatefulWidget {
  @override
  _TestFlowState createState() => _TestFlowState();
}

class _TestFlowState extends State<TestFlow> {
  final key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlowBloc(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<FlowBloc, FlowState>(
            listenWhen: (previous, current) => current is FlowStateCompleted,
            listener: (context, state) => Navigator.of(context).pop(state),
            buildWhen: (previous, current) => current is FlowStepState,
            builder: (context, state) {
              return FlowBuilder<FlowStepState>(
                key: key,
                state: state,
                onPop: () {
                  BlocProvider.of<FlowBloc>(context).add(FlowStepPop());
                },
                onGeneratePages: (state, pages) => [
                  MaterialPage(key: ValueKey(0), child: TestStep1()),
                  if (state.feature1 != null)
                    MaterialPage(key: ValueKey(1), child: TestStep2()),
                  if (state.feature2 != null)
                    MaterialPage(key: ValueKey(2), child: TestStep3()),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
