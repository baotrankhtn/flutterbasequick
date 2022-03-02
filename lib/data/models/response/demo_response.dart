import '/data/models/demo_info.dart';
import '/data/models/response/base/base_response.dart';

class DemoResponse extends BaseResponseData<DemoInfo> {
  @override
  DemoInfo parseData(data) {
    // data is List
    // return (data as List<dynamic>).map((e) => DemoInfo.fromMap(e)).toList();

    // data is Map
    return DemoInfo.fromMap(data);
  }
}
