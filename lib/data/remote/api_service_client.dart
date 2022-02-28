import '/data/local/pref_repository.dart';
import 'package:http/http.dart';

///
/// Set up interceptors
///
class ApiServiceClient extends BaseClient {
  ApiServiceClient({this.prefRepository});

  final PrefRepository? prefRepository;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    // Add Authorization
    // request.headers.putIfAbsent('Authorization', () => accessToken);

    return request.send();
  }
}
