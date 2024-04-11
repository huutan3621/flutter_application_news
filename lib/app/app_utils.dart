import 'package:intl/intl.dart';

class AppUtils {
  static String formatDate(DateTime? publishedAt) {
    if (publishedAt != null) {
      return DateFormat('dd/MM/yyyy').format(publishedAt ?? DateTime.now());
    } else {
      return "";
    }
  }
}
