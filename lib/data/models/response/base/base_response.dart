import '/data/exceptions/api_exception.dart';

abstract class BaseResponseData<T> {
  BaseError? error;
  T? data;

  ///
  /// Parse T
  ///
  T parseData(dynamic data);

  ///
  /// Parse all response data
  ///
  BaseResponseData<T> tryParse(dynamic data) {
    try {
      if (data is Map && data.containsKey("error")) {
        // Error
        this.error = BaseError.fromMap(data["error"]);
      } else {
        // Success
        this.data = parseData(data);
      }
    } catch (e) {
      throw ParseDataException()..message = e.toString();
    }
    return this;
  }
}

class BaseError {
  String? errorCode;
  String? errorMsg;
  List<ValidationError>? validationErrors;

  BaseError({this.errorCode, this.errorMsg, this.validationErrors});

  factory BaseError.fromMap(Map<String, dynamic> map) {
    // Error code & errror message
    final code = map["code"] as String?;
    final message = map["message"] as String?;

    // Validation errors
    List<ValidationError>? validationErrors = [];
    if (map["validationErrors"] != null) {
      validationErrors = (map["validationErrors"] as List<dynamic>)
          .map((e) => ValidationError.fromMap(e))
          .toList();
    }
    return BaseError(
        errorCode: code, errorMsg: message, validationErrors: validationErrors);
  }
}

class ValidationError {
  String? message;
  List<dynamic>? members;

  ValidationError({this.message, this.members});

  factory ValidationError.fromMap(Map<String, dynamic> map) {
    final message = map["message"];
    final members = (map["members"] as List<dynamic>).map((e) => e).toList();
    return ValidationError(message: message, members: members);
  }
}

class Result<T extends BaseResponseData, V extends Exception> {
  T? response;
  V? exception;
  Result({required this.response, required this.exception});

  bool isSuccessful() {
    if (exception == null && response?.data != null) {
      return true;
    }
    return false;
  }
}
