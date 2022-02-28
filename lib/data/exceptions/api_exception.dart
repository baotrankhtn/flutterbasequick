import 'app_exception.dart';

class ApiException extends AppException {}

class NeedRefreshTokenException extends ApiException {}

class RefreshTokenFailException extends ApiException {}

class ParseDataException extends ApiException {}

class ServerException extends ApiException {}

class UnknownApiException extends ApiException {}
