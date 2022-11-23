import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AutoCreateTrans {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;

  // collection reference
  final CollectionReference transCollection =
      FirebaseFirestore.instance.collection('transactions');

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
          'service_name': serviceName,
          'sms': sms,
          'uid': "/users/$uid",
          'status': ''
        })
        .then((value) => print(" Added"))
        .catchError((error) => print("Failed to add : $error"));
  }

  Future<void> unsaved({String sms = '', SmsDate}) async {
    return await transCollection
        .add({'sms': sms, 'uid': "/users/$uid", 'smsDate': SmsDate})
        .then((value) => print(" Added"))
        .catchError((error) => print("Failed to add : $error"));
  }

  dynamic getFormatedDate(String _date, smsDate) {
    if (!_date.contains('/')) {
      _date = smsDate;
    }

    var inputFormat = DateFormat('dd/MM/yy HH:mm');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yy hh:mm a');
    return outputFormat.format(inputDate);
  }

  forEvcPlus(sms, smsDate) {
    List<String> types = ['recharged', 'transferred', 'paid', 'Received'];

    // english sent to normal mobile evc plus
    if (sms.contains('transferred')) {
      // String test ='[-EVCPlus-] You have successfully transferred \$500 to 0611345804 at 22/11/22 17:21:21, Your Balance is \$19.26.';

      dynamic me = sms.split(" ");
      dynamic amount = me[5].replaceAll(RegExp('[^0-9]'), '');
      dynamic mobile = me[7];
      dynamic date = getFormatedDate(me[9] + ' ' + me[10], '');
      String type = 'transferred';
      dynamic serviceName = me[0];
      // then save to firestore
      saveTrans(
          amount: amount,
          mobile: mobile,
          date: date,
          type: type,
          color: '#330000',
          serviceName: serviceName,
          sms: sms);
    } else if (sms.contains('You have paid')) {
      // english sent to Account evc plus
      //  String test =   '[-EVCPlus-] You have paid  \$2000.5 to SAxaaba modern Pharma(600399),Tel: +252613405050, at 21/11/22 22:27:28, Your Balance is \$38.01.';
      dynamic me = sms.split(" ");
      dynamic amount = me[5].replaceAll(RegExp('[^0-9]'), ''); // amount deboule
      dynamic mobile = me[10].split(",")[0]; // mobile
      dynamic date = getFormatedDate(me[12] + ' ' + me[13], '');
      String type = 'paid';
      dynamic serviceName = me[0];
      saveTrans(
          amount: amount,
          mobile: mobile,
          color: '#330000',
          date: date,
          type: type,
          serviceName: serviceName,
          sms: sms);
    } else if (sms.contains('Received from')) {
      // received english evc from normal number
      //String test = '[-EVCPlus-] \$40 Received from 0611381010 at 21/11/22 19:51:38, Your balance is \$42.01';
      dynamic me = sms.split(" ");
      dynamic amount = me[1].replaceAll(RegExp('[^0-9]'), '');
      dynamic mobile = me[4];
      dynamic date = getFormatedDate(me[6] + ' ' + me[7], '');
      String type = 'Received';
      dynamic serviceName = me[0];
      saveTrans(
          amount: amount,
          mobile: mobile,
          date: date,
          color: '#006600',
          type: type,
          serviceName: serviceName,
          sms: sms);
    } else if (sms.contains('recharged')) {
// Recharged from EvcPlus english
      // String test = '[-EVCPlus-] You have recharged \$0.25 to 252611541955, Your balance is \$2.01.';
      dynamic me = sms.split(" ");
      String type = 'recharged';

      dynamic serviceName = me[0];
      dynamic amount = me[4].replaceAll(RegExp('[^0-9]'), '');
      dynamic mobile = me[6];
      dynamic date = getFormatedDate(me[6] + ' ' + me[7], '21/11/22 19:51:38');

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
  }

  forSahal(sms, smsDate) {}

  addTrans(String sms, smsDate) {
    if (sms.contains('EVCPlus')) {
      forEvcPlus(sms, smsDate);
    } else if (sms.contains('sahal')) {
      forSahal(sms, smsDate);
    }
  }

// only run when the app is lounched
  readImbox(currentSms, smsDate) async {
    if (currentSms.contains('EVCPlus')) {
      final snapShot = await transCollection
          .where('sms', isEqualTo: currentSms)
          .where('uid', isEqualTo: "/users/$uid")
          .get();

      if (snapShot == null || !snapShot.docs.isNotEmpty) {
        addTrans(currentSms, smsDate);
      }
    }
  }
}
