import 'package:intl/intl.dart';

/* bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

dynamic validated(amount, date) {
  if (isNumeric(amount)) {
    try {
      var inputFormat = DateFormat('dd/MM/yy HH:mm');
      var inputDate = inputFormat.parse(date);
      var outputFormat = DateFormat('dd/MM/yy hh:mm a');
      return true;
    } catch (e) {
      return 'invalid date';
    }
  } else {
    return false;
  }
} */

dynamic getFormatedDate(String _date) {
  var inputFormat = DateFormat('dd/MM/yy HH:mm');
  var inputDate = inputFormat.parse(_date);
  var outputFormat = DateFormat('dd/MM/yy hh:mm a');
  return outputFormat.format(inputDate);
}

void main() {
  String sms =
      "[-EVCPlus-] \$5 received from QAASIM CALI BURAALE(252905058585),19/11/22 17:28:25 via Sahal mfs, your balance is \$5.01.";

  dynamic me = sms.split(" ");
  dynamic amount = me[1].replaceAll(',', '').replaceAll('\$', '');
  dynamic mobile = me[6].split("(")[1].split(",")[0].replaceAll(')', '');
  dynamic date = getFormatedDate(me[6].split(",")[1] + ' ' + me[7]);
  String type = 'Received';
  dynamic serviceName = me[0];
  print(date);
  print(amount);
  print(mobile);
}
