import '/data/models/request/base/base_request.dart';

class DemoRequest extends BaseRequestData {
  final String? query1;

  DemoRequest({this.query1});

  Map<String, dynamic> toMap() {
    return {"query1": query1};
  }
}
