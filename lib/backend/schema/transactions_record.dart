import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transactions_record.g.dart';

abstract class TransactionsRecord
    implements Built<TransactionsRecord, TransactionsRecordBuilder> {
  static Serializer<TransactionsRecord> get serializer =>
      _$transactionsRecordSerializer;

  String? get number;

  String? get sms;

  @BuiltValueField(wireName: 'service_provider')
  String? get serviceProvider;

  double? get amount;

  String? get type;

  String? get status;

  DocumentReference? get uid;

  DateTime? get date;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TransactionsRecordBuilder builder) => builder
    ..number = ''
    ..sms = ''
    ..serviceProvider = ''
    ..amount = 0.0
    ..type = ''
    ..status = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TransactionsRecord._();
  factory TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =
      _$TransactionsRecord;

  static TransactionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTransactionsRecordData({
  String? number,
  String? sms,
  String? serviceProvider,
  double? amount,
  String? type,
  String? status,
  DocumentReference? uid,
  DateTime? date,
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = serializers.toFirestore(
    TransactionsRecord.serializer,
    TransactionsRecord(
      (t) => t
        ..number = number
        ..sms = sms
        ..serviceProvider = serviceProvider
        ..amount = amount
        ..type = type
        ..status = status
        ..uid = uid
        ..date = date
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber,
    ),
  );

  return firestoreData;
}
