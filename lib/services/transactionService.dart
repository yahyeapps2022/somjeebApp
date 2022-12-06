import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sms_advanced/sms_advanced.dart';

class AutoCreateTrans {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  // collection reference
  final CollectionReference transCollection =
      FirebaseFirestore.instance.collection('transactions');
  final CollectionReference unsavedCollection =
      FirebaseFirestore.instance.collection('unsaved_transactions');

  Future<void> saveTrans(
      {String type = '',
      String mobile = '',
      String date = '',
      String serviceName = '',
      String sms = '',
      String color = '',
      double amount = 0}) async {
    return await transCollection
        .add({
          'amount': amount,
          'type': type,
          'mobile': mobile,
          'date': date,
          'color': color,
          'serviceName': serviceName,
          'sms': sms,
          'uid': "/users/$uid",
          'status': ''
        })
        .then((value) => print(" Added"))
        .catchError((error) => print("Failed to add "));
  }

  Future<void> unsaved({String sms = '', SmsDate}) async {
    return await unsavedCollection
        .add({'sms': sms, 'uid': "/users/$uid", 'smsDate': SmsDate})
        .then((value) => print(" Added"))
        .catchError((error) => print("Failed to add "));
  }

  bool validated(amount, date) {
    if (isNumeric(amount)) {
      try {
        var inputFormat = DateFormat('dd/MM/yy HH:mm');
        var inputDate = inputFormat.parse(date);
        var outputFormat = DateFormat('dd/MM/yy hh:mm a');
        return true;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  dynamic getFormatedDate(String _date) {
    var inputFormat = DateFormat('dd/MM/yy HH:mm');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yy hh:mm a');
    return outputFormat.format(inputDate);
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool isOtherTelecom(sms) {
    if (sms.contains('Sahal') ||
        sms.contains('Telesom') ||
        sms.contains("Somnet Telecom")) {
      return true;
    } else {
      return false;
    }
  }

  bool isMoneyTransaction(sms) {
    if (sms.contains('Sahal') ||
        sms.contains('Telesom') ||
        sms.contains('EVCPlus') ||
        sms.contains("Somnet Telecom")) {
      return true;
    } else {
      return false;
    }
  }

  forEvcPlus(sms, smsDate) {
    List<String> types = ['recharged', 'transferred', 'paid', 'Received'];

    // english sent to normal mobile evc plus
    if (sms.contains('transferred')) {
      // String test ='[-EVCPlus-] You have successfully transferred \$500 to 0611345804 at 22/11/22 17:21:21, Your Balance is \$19.26.';

      dynamic me = sms.split(" ");
      dynamic amount = me[5].replaceAll(',', '').replaceAll('\$', '');
      dynamic mobile = me[7];
      dynamic date = getFormatedDate(me[9] + ' ' + me[10]);
      String type = 'transferred';
      dynamic serviceName = me[0];
      // then save to firestore
      if (validated(amount, date)) {
        print('is transfered');
        saveTrans(
            amount: amount,
            mobile: mobile,
            color: '#330000',
            date: date,
            type: type,
            serviceName: serviceName,
            sms: sms);
      } else {
        // unsaved transactions collections
        unsaved(sms: sms, SmsDate: smsDate);
      }
    } else if (sms.contains('You have paid')) {
      // english sent to Account evc plus
      //  String test =   '[-EVCPlus-] You have paid  \$2000.5 to SAxaaba modern Pharma(600399),Tel: +252613405050, at 21/11/22 22:27:28, Your Balance is \$38.01.';
      dynamic me = sms.split(" ");
      dynamic amount =
          me[5].replaceAll(',', '').replaceAll('\$', ''); // amount deboule
      dynamic mobile = me[10].split(",")[0]; // mobile
      dynamic date = getFormatedDate(me[12] + ' ' + me[13]);
      String type = 'paid';
      dynamic serviceName = me[0];

      if (validated(amount, date)) {
        saveTrans(
            amount: amount,
            mobile: mobile,
            color: '#330000',
            date: date,
            type: type,
            serviceName: serviceName,
            sms: sms);
      } else {
        // unsaved transactions collections
        unsaved(sms: sms, SmsDate: smsDate);
      }
    } else if (sms.contains('received from') && sms.contains('TAWAKAL')) {
      // recieved from tawakal
      dynamic me = sms.split(" ");
      dynamic amount = me[1].replaceAll(',', '').replaceAll('\$', '');
      dynamic mobile = me[5].split("(")[1].split(",")[0].replaceAll(')', '');
      dynamic date = getFormatedDate(me[5].split(",")[1] + ' ' + me[6]);
      String type = 'Received';
      dynamic serviceName = me[0];

      if (validated(amount, date)) {
        saveTrans(
            amount: amount,
            mobile: mobile,
            color: '#006600',
            date: date,
            type: type,
            serviceName: serviceName,
            sms: sms);
      } else {
        // unsaved transactions collections
        unsaved(sms: sms, SmsDate: smsDate);
      }
    } else if (sms.contains('received from') && isOtherTelecom(sms)) {
      // recieved from sahal,telsom,somnet
      dynamic me = sms.split(" ");
      dynamic amount = me[1].replaceAll(',', '').replaceAll('\$', '');
      dynamic mobile = me[6].split("(")[1].split(",")[0].replaceAll(')', '');
      dynamic date = getFormatedDate(me[6].split(",")[1] + ' ' + me[7]);
      String type = 'Received';
      dynamic serviceName = me[0];
      if (validated(amount, date)) {
        saveTrans(
            amount: amount,
            mobile: mobile,
            color: '#006600',
            date: date,
            type: type,
            serviceName: serviceName,
            sms: sms);
      } else {
        // unsaved transactions collections
        unsaved(sms: sms, SmsDate: smsDate);
      }
    } else if (sms.contains('Received from')) {
      // received   evc from normal number
      dynamic me = sms.split(" ");
      dynamic amount = me[1].replaceAll(',', '').replaceAll('\$', '');
      dynamic mobile = me[4];
      dynamic date = getFormatedDate(me[6] + ' ' + me[7]);
      String type = 'Received';
      dynamic serviceName = me[0];

      if (validated(amount, date)) {
        saveTrans(
            amount: amount,
            mobile: mobile,
            color: '#006600',
            date: date,
            type: type,
            serviceName: serviceName,
            sms: sms);
      } else {
        // unsaved transactions collections
        unsaved(sms: sms, SmsDate: smsDate);
      }
    } else if (sms.contains('recharged')) {
// Recharged from EvcPlus english
      // String test = '[-EVCPlus-] You have recharged \$0.25 to 252611541955, Your balance is \$2.01.';
      dynamic me = sms.split(" ");
      String type = 'recharged';

      dynamic serviceName = me[0];
      dynamic amount = me[4].replaceAll(',', '').replaceAll('\$', '');
      dynamic mobile = me[6];
      dynamic date = getFormatedDate(smsDate);

      if (validated(amount, date)) {
        saveTrans(
            amount: amount,
            mobile: mobile,
            color: '#330000',
            date: date,
            type: type,
            serviceName: serviceName,
            sms: sms);
      } else {
        // unsaved transactions collections
        unsaved(sms: sms, SmsDate: smsDate);
      }
    } else {
      unsaved(sms: sms, SmsDate: smsDate);
    }
  }

  forSahal(sms, smsDate) {}

  addTrans(sms, smsDate) {
    if (sms.contains('EVCPlus')) {
      forEvcPlus(sms, smsDate);
    } else if (sms.contains('sahal')) {
      forSahal(sms, smsDate);
    }
  }

  smsRecieved(currentSms, smsDate) async {
    if (isMoneyTransaction(currentSms)) {
      final snapShot = await transCollection
          .where('sms', isEqualTo: currentSms)
          .where('uid', isEqualTo: "/users/$uid")
          .get();

      if (snapShot.docs.isEmpty) {
        addTrans(currentSms, smsDate);
      }
    }
  }

  readImbox() async {
    SmsQuery query = new SmsQuery();
    List<SmsMessage> messages =
        await query.querySms(kinds: [SmsQueryKind.Inbox]);

    for (var i = 0; i < messages.length; i++) {
      // TO DO
      addTrans(messages[i].body.toString(), messages[i].date.toString());
    }
  }

  smsListen() {
    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived
        ?.listen((SmsMessage msg) => smsRecieved(msg.body, msg.date));
  }
}
