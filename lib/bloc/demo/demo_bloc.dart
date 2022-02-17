import '/bloc/base/base_bloc.dart';

import 'demo_state.dart';

class DemoBloc extends BaseBloc<DemoState> {
  // final AppRepository appRepository;
  DemoBloc() : super(DemoState());

  int _count = 0;

  void increaseValue() {
    _count = _count + 1;
    emit(DemoIntState(value: _count));
  }

  void getValue() {
    emit(DemoIntState(value: _count));
  }

  Future<void> requestNetwork() async {
    // emit(DemoLoadingState());
    // var result = await appRepository.apiService.getDemo();
    // if (result.isSuccessful()) {
    //   emit(DemoNetworkState(data: result.response!.toMap().toString()));
    // } else {
    //   emit(DemoNetworkState(data: getErrorMessage(result)));
    // }
  }
}
