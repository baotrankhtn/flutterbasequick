import 'dart:convert';

import '/common/utils/network_utils.dart';
import '/data/exceptions/api_exception.dart';
import '/data/exceptions/app_exception.dart';
import '/data/models/response/base/base_response.dart';

import '/common/logger/logger.dart';

import 'package:http/http.dart';

import 'api_service.dart';
import 'api_service_client.dart';

class ApiServiceHelper {
  static final ApiServiceHelper _singleton = ApiServiceHelper._internal();

  final ApiServiceClient _httpClient = ApiServiceClient();

  factory ApiServiceHelper() {
    return _singleton;
  }

  ApiServiceHelper._internal();

  ///
  /// Base function to handle requests
  /// request: GET, POST, PUT, DELETE
  /// return: Result<T extends BaseResponse, Exception>
  ///
  Future<Result<T, Exception>> handleResponse<T extends BaseResponseData>(
      {required Function request, isRetryAfterRefreshToken = false}) async {
    Result<T, Exception> result = Result(response: null, exception: null);

    // Check network before each request
    if (await NetworkUtils.isNetworkAvailable() == false) {
      result.exception = NoInternetException();
      return result;
    }

    // Try requesting
    try {
      result.response = await request.call();
      // }
      // on NeedRefreshTokenException catch (e) {
      //   if (isRetryAfterRefreshToken) {
      //     result.exception = RefreshTokenFailException();
      //     AppUtils.logout(showInfoDialog: true);
      //     Logger.error(result.exception.toString());
      //   } else {
      //     // Logged in and token expired => refresh token
      //     // Refresh token success => try request again
      //     var refreshToken =
      //         locator.get<PrefRepository>().getUserSession()?.refreshToken;
      //     if (refreshToken != null) {
      //       var statusCode = await handleRefreshToken(refreshToken);
      //       if (statusCode == 200) {
      //         result = await handleResponse(
      //             request: request, isRetryAfterRefreshToken: true);
      //       } else {
      //         result.exception = RefreshTokenFailException();
      //         AppUtils.logout(showInfoDialog: true);
      //         Logger.error(result.exception.toString());
      //       }
      //     } else {
      //       result.exception = RefreshTokenFailException();
      //       AppUtils.logout(showInfoDialog: true);
      //       Logger.error(result.exception.toString());
      //     }
      //   }
    } on ParseDataException catch (e) {
      Logger.error(e.message ?? "");
      result.exception = e;
    } on Exception catch (e) {
      Logger.error(e.toString());
      result.exception = e;
    } catch (e) {
      Logger.error(e.toString());
      result.exception = UnknownApiException();
    }
    return result;
  }

  dynamic _checkHttpResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
      case 400:
      case 403:
      case 404:
        dynamic responseJson = "";
        if (response.body.isNotEmpty) {
          responseJson = json.decode(response.body.toString());
        }
        _logResponse(code: response.statusCode, body: response.body);
        return responseJson;
      case 401:
        throw NeedRefreshTokenException();
      case 500:
        throw ServerException();
      default:
        throw UnknownApiException();
    }
  }

  ///
  /// Base GET method
  /// Exception will be catched in handleResponse()
  ///
  Future<dynamic> get(
      {required String url, Map<String, String>? headers}) async {
    _logRequest(requestType: "GET", url: url, headers: headers);
    final response = await _httpClient
        .get(Uri.parse(url), headers: headers)
        .timeout(const Duration(seconds: ApiConfigs.TIME_OUT_SECONDS));
    var responseJson = _checkHttpResponse(response);
    return responseJson;
  }

  ///
  /// Base POST method
  /// Exception will be catched in handleResponse()
  ///
  Future<dynamic> post(
      {required String url,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding}) async {
    _logRequest(requestType: "POST", url: url, headers: headers, body: body);
    final response = await _httpClient
        .post(Uri.parse(url), headers: headers, body: body, encoding: encoding)
        .timeout(const Duration(seconds: ApiConfigs.TIME_OUT_SECONDS));
    var responseJson = _checkHttpResponse(response);
    return responseJson;
  }

  ///
  /// Base PUT method
  /// Exception will be catched in handleResponse()
  ///
  Future<dynamic> put(
      {required String url,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding}) async {
    _logRequest(requestType: "PUT", url: url, headers: headers, body: body);
    final response = await _httpClient
        .put(Uri.parse(url), headers: headers, body: body, encoding: encoding)
        .timeout(const Duration(seconds: ApiConfigs.TIME_OUT_SECONDS));
    var responseJson = _checkHttpResponse(response);
    return responseJson;
  }

  ///
  /// Base DELETE method
  /// Exception will be catched in handleResponse()
  ///
  Future<dynamic> delete(
      {required String url,
      Map<String, String>? headers,
      Object? body,
      Encoding? encoding}) async {
    _logRequest(requestType: "DELETE", url: url, headers: headers, body: body);
    final response = await _httpClient
        .delete(Uri.parse(url),
            headers: headers, body: body, encoding: encoding)
        .timeout(const Duration(seconds: ApiConfigs.TIME_OUT_SECONDS));
    var responseJson = _checkHttpResponse(response);
    return responseJson;
  }

  // Future<dynamic> handleRefreshToken(String refreshToken) async {
  //   Logger.info("Start refresh token: $refreshToken");
  //   var authUrl = FlavorConfig.instance.values.authUrl;

  //   final response = await _httpClient.post(
  //     Uri.parse(authUrl + ApiPath.LOGIN),
  //     headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //     body: {
  //       "grant_type": "refresh_token",
  //       "scope": "offline_access openid profile role email phone",
  //       "client_id": FlavorConfig.instance.values.clientId,
  //       "client_secret": FlavorConfig.instance.values.clientSecret,
  //       "refresh_token": refreshToken,
  //     },
  //   ).timeout(Duration(seconds: ApiConfigs.TIME_OUT_SECONDS));

  //   if (response.statusCode == 200) {
  //     var responseJson = json.decode(response.body.toString());
  //     var sessionInfo = SessionInfo.fromJson(responseJson);
  //     locator.get<PrefRepository>().saveUserSession(sessionInfo);
  //   }

  //   return response.statusCode;
  // }

  void _logRequest(
      {required String requestType,
      required String url,
      Map<String, String>? headers,
      Object? body}) {
    Logger.info(
        "[$requestType REQUEST]\n[Url]: $url \n[Header]: $headers \n[Body]: $body");
  }

  void _logResponse({required int code, required dynamic body}) {
    Logger.info("[RESPONSE]\n[Code]: $code \n[Body]: $body");
  }
}
