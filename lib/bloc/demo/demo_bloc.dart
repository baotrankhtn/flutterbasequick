import '/data/models/request/demo_request.dart';

import '/data/app_repository.dart';

import '/bloc/base/base_bloc.dart';

import 'demo_state.dart';

class DemoBloc extends BaseBloc<DemoState> {
  final AppRepository appRepository;
  DemoBloc({required this.appRepository}) : super(DemoState());

  int _count = 0;

  void increaseValue() {
    _count = _count + 1;
    emit(DemoIntState(value: _count));
  }

  void getValue() {
    emit(DemoIntState(value: _count));
  }

  Future<void> requestNetwork() async {
    emit(DemoLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    var result = await appRepository.apiService
        .getDemo(DemoRequest(query1: "demo_request_1"));
    if (result.isSuccessful()) {
      final data = result.response!.data!;
      emit(DemoNetworkState(data: data)
        ..isSuccessful = true
        ..message = "");
    } else {
      emit(DemoNetworkState(data: null)
        ..isSuccessful = false
        ..message = getErrorMessage(result));
    }
    emit(DemoDismissLoadingState());
  }
}
