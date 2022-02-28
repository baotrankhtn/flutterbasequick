import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/exceptions/app_exception.dart';
import '/data/models/response/base/base_response.dart';
import '/gen/localization/l10n.dart';

import 'base_state.dart';

abstract class BaseBloc<T extends BaseState> extends Cubit<T> {
  BaseBloc(T state) : super(state);

  ///
  /// Get error message to show
  ///
  String getErrorMessage(Result result) {
    String? msg = "";
    if (result.exception != null) {
      if (result.exception is NoInternetException) {
        msg = S.current.error_no_internet;
      }
    } else if (result.response != null) {
      msg = result.response?.error?.errorMsg;
    }

    if (msg == null || msg.isEmpty) {
      msg = S.current.error_unknown;
    }
    return msg;
  }
}
