import 'package:intl/intl.dart';

extension IDRFormatter on double {
  String toIDR() {
    final format = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return format.format(this);
  }
}