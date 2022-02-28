import 'package:flutterbasequick/data/models/request/demo_request.dart';

import '/data/models/response/demo_response.dart';

import '/data/models/response/base/base_response.dart';

import 'api_service_helper.dart';

class ApiConfigs {
  static const TIME_OUT_SECONDS = 30;
}

class ApiPath {
  static const DEMO = "/v1/abc";
}

class ApiService {
  final String appUrl;
  final ApiServiceHelper _apiServiceHelper = ApiServiceHelper();

  ApiService({required this.appUrl});

  // =========================== DEMO ===============================
  Future<Result<DemoResponse, Exception>> getDemo(DemoRequest request) async {
    return _apiServiceHelper.handleResponse<DemoResponse>(request: () async {
      var url = 'https://jsonplaceholder.typicode.com/albums/1' '?' +
          Uri(queryParameters: request.toMap()).query;
      var response = await _apiServiceHelper.get(
        url: url,
        // headers: {"Content-Type": "application/json"}, if POST json body
        // body
      );
      // Parse data here to BaseResponse
      return DemoResponse().tryParse(response);
    });
  }
}
