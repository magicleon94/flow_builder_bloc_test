import 'package:flow_builder_bloc_test/test_flow/bloc/flow_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestStep1 extends StatelessWidget {
  const TestStep1({Key key}) : super(key: key);
  void onPressed(BuildContext context) {
    BlocProvider.of<FlowBloc>(context).add(FlowStep1Done());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Feature 1 is ${(BlocProvider.of<FlowBloc>(context).state as FlowStepState)?.feature1}'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Next'),
          onPressed: () => onPressed(context),
        ),
      ),
    );
  }
}

class TestStep2 extends StatelessWidget {
  const TestStep2({Key key}) : super(key: key);
  void onPressed(BuildContext context) {
    BlocProvider.of<FlowBloc>(context).add(FlowStep2Done());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Feature 2 is ${(BlocProvider.of<FlowBloc>(context).state as FlowStepState)?.feature2}'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Next'),
          onPressed: () => onPressed(context),
        ),
      ),
    );
  }
}

class TestStep3 extends StatelessWidget {
  const TestStep3({Key key}) : super(key: key);
  void onPressed(BuildContext context) {
    BlocProvider.of<FlowBloc>(context).add(FlowStep3Done());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Feature 3 is ${(BlocProvider.of<FlowBloc>(context).state as FlowStepState)?.feature3}'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Next'),
          onPressed: () => onPressed(context),
        ),
      ),
    );
  }
}
