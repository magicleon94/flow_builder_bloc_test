# flow_builder_bloc_test

Testing the interaction between [flutter_bloc](https://pub.dev/packages/flutter_bloc) and [flow_builder](https://pub.dev/packages/flow_builder).

This is a demo supporting [this issue](https://github.com/felangel/flow_builder/issues/10)


The `TestFlow` has three steps, each step adds an event to the bloc and the bloc yields an update state for each action, and a `FlowCompleted` event to allow the flow to pop away with the final result state.

# Issues encoutered
If we go through the process linearly by presisng next in each page, everything behaves as expected.
If we go back during the process the bloc has no clue of what's happening so something like this might happen:

- The user taps Next on Step 1 which adds the `FlowStep1Done` event
- Bloc yields `FlowState(feature1:true, feature2:null, feature3: null)` (I've explicitly written the null values here)
- The flow navigates to Step 2
- The user hits back, so the flow goes back to Step 1
- The user now taps again Next on Step1 which will add once again the `FlorStep1Done` event
- The bloc will yield the same state `FlowState(feature1:true, feature2:null, feature3: null)` which is identical to the previous one, hence no rebuild will happen and the flow will stay the same without navigating to Step 2.

The good thing would be to notify the bloc upon popping the page in order to reset `feature1` to `null` as the beginning, undoing the action that led to navigating to Step 2 in the first place.

Messing with the equality of the state is not an option here, I believe.