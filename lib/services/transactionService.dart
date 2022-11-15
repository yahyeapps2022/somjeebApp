import 'package:somjeeb/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid = FirebaseAuth.instance.currentUser.uid;

  // collection reference
  final CollectionReference transCollection = Firestore.instance.collection('transactions');

  Future<void> SaveTrans( String sms) async {
      if(){
       transModel transData = extractSahalTransFromSms(String sms);
      }else{
       transModel transData = extractEvcTransFromSms(String sms);
      }

    return await transCollection.docs(this.uid).set({
      'type': transData.type,
      'mobile': transData.mobile,
      'date': transData.date,
      'service_name':transData.serviceName,
      'sms':transData.sms,
      'uid':uid,
      'status':''
    });
  }
// sahal trasaction 
transModel extractSahalTransFromSms(String sms){
  return transModel(
   type:??''
    amount:??0,
    mobile:??'',
    date:??'',
    serviceName:??'',
    sms:??'',
    uid:this.uid??'',
    );
}

// evc transaction 
transModel extractEvcTransFromSms(String sms){
  return transModel(
   type:??''
    amount:??0,
    mobile:??'',
    date:??'',
    serviceName:??'',
    sms:??'',
    uid:this.uid??'',
    );
}

}