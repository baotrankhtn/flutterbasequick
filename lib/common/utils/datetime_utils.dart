import 'package:intl/intl.dart';

class DateTimeUtils {
  static String convertToDateString(String input,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      String outputFormat = "dd/MM/yyyy"}) {
    String result = "";
    try {
      DateTime parseDate = DateFormat(inputFormat).parse(input, true);
      result = DateFormat(outputFormat).format(parseDate.toLocal());
    } catch (e) {
      result = "";
    }
    return result;
  }

  static String convertToDateTimeString(String input,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      String outputFormat = "dd/MM/yyyy HH:mm"}) {
    String result = "";
    try {
      DateTime parseDate = DateFormat(inputFormat).parse(input);
      result = DateFormat(outputFormat).format(parseDate.toLocal());
    } catch (e) {
      result = "";
    }
    return result;
  }
}
