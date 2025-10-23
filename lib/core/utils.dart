import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat.simpleCurrency(decimalDigits: 0, name: 'TK ');

String getTermLabel(int termNumber) {
  if (termNumber % 100 >= 11 && termNumber % 100 <= 13) {
    return '${termNumber}th term';
  }

  switch (termNumber % 10) {
    case 1:
      return '${termNumber}st term';
    case 2:
      return '${termNumber}nd term';
    case 3:
      return '${termNumber}rd term';
    default:
      return '${termNumber}th term';
  }
}
