import 'package:intl/intl.dart';

bool isNumeric(String s) {
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
}

void main() {
  // english sent to normal mobile evc plus
/* String test = '[-EVCPlus-] You have successfully transferred \$5 to 0611345804 at 22/11/22 17:21:21, Your Balance is \$19.26.';

dynamic me = test.split(" ");
dynamic amount = me[5].split("\$")[1];
dynamic mobile = me[7];  
dynamic date = me[9];
  
  */

  // english sent to Account evc plus
  String test =
      '[-EVCPlus-] You have paid  \$2,00\$0.5 to SAxaaba modern Pharma(600399),Tel: +252613405050, at 21/11/22 22:27:28, Your Balance is \$38.01.';
  dynamic me = test.split(" ");
  dynamic amount = me[5].replaceAll(',', '').replaceAll('\$', '');
  dynamic mobile = me[10].split(",")[0];
  dynamic date = me[12] + ' ' + me[13];
  //var inputFormat = DateFormat('dd/MM/yy HH:mm');

  print(amount);
  print(date);
  print(validated(amount, date));
}
