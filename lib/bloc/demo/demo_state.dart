import '/bloc/base/base_state.dart';

class DemoState extends BaseState {}

class DemoIntState extends DemoState {
  DemoIntState({required this.value});
  final int value;
}

class DemoLoadingState extends DemoState {}

class DemoNetworkState extends DemoState {
  DemoNetworkState({required this.data});
  final String data;
}
