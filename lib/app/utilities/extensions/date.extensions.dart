import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get hh_mm_a => DateFormat('hh:mm a').format(
    DateFormat("yyyy-MM-dd HH:mm:ss").parse(
      toString(),
    ),
  );
}
