import 'package:intl/intl.dart';

extension DateTimeStringProvider on String {
  String provideDateString() {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    DateFormat format = DateFormat("dd-MM-yyyy");
    DateTime currentDate = format.parse(this);
    return '${months[currentDate.month - 1].substring(0, 3)} ${currentDate.day}, ${currentDate.year}';
  }

  String timeWithAmPmProvider() {
    return DateFormat('hh:mm a').format(DateTime.parse('2021-09-29 $this'));
  }
}
