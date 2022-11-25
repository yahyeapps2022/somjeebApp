// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionsRecord> _$transactionsRecordSerializer =
    new _$TransactionsRecordSerializer();

class _$TransactionsRecordSerializer
    implements StructuredSerializer<TransactionsRecord> {
  @override
  final Iterable<Type> types = const [TransactionsRecord, _$TransactionsRecord];
  @override
  final String wireName = 'TransactionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TransactionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.number;
    if (value != null) {
      result
        ..add('number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sms;
    if (value != null) {
      result
        ..add('sms')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceProvider;
    if (value != null) {
      result
        ..add('service_provider')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TransactionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sms':
          result.sms = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_provider':
          result.serviceProvider = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionsRecord extends TransactionsRecord {
  @override
  final String? number;
  @override
  final String? sms;
  @override
  final String? serviceProvider;
  @override
  final double? amount;
  @override
  final String? type;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? uid;
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TransactionsRecord(
          [void Function(TransactionsRecordBuilder)? updates]) =>
      (new TransactionsRecordBuilder()..update(updates))._build();

  _$TransactionsRecord._(
      {this.number,
      this.sms,
      this.serviceProvider,
      this.amount,
      this.type,
      this.status,
      this.uid,
      this.date,
      this.ffRef})
      : super._();

  @override
  TransactionsRecord rebuild(
          void Function(TransactionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionsRecordBuilder toBuilder() =>
      new TransactionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionsRecord &&
        number == other.number &&
        sms == other.sms &&
        serviceProvider == other.serviceProvider &&
        amount == other.amount &&
        type == other.type &&
        status == other.status &&
        uid == other.uid &&
        date == other.date &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, number.hashCode), sms.hashCode),
                                serviceProvider.hashCode),
                            amount.hashCode),
                        type.hashCode),
                    status.hashCode),
                uid.hashCode),
            date.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionsRecord')
          ..add('number', number)
          ..add('sms', sms)
          ..add('serviceProvider', serviceProvider)
          ..add('amount', amount)
          ..add('type', type)
          ..add('status', status)
          ..add('uid', uid)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TransactionsRecordBuilder
    implements Builder<TransactionsRecord, TransactionsRecordBuilder> {
  _$TransactionsRecord? _$v;

  String? _number;
  String? get number => _$this._number;
  set number(String? number) => _$this._number = number;

  String? _sms;
  String? get sms => _$this._sms;
  set sms(String? sms) => _$this._sms = sms;

  String? _serviceProvider;
  String? get serviceProvider => _$this._serviceProvider;
  set serviceProvider(String? serviceProvider) =>
      _$this._serviceProvider = serviceProvider;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _uid;
  DocumentReference<Object?>? get uid => _$this._uid;
  set uid(DocumentReference<Object?>? uid) => _$this._uid = uid;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TransactionsRecordBuilder() {
    TransactionsRecord._initializeBuilder(this);
  }

  TransactionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _number = $v.number;
      _sms = $v.sms;
      _serviceProvider = $v.serviceProvider;
      _amount = $v.amount;
      _type = $v.type;
      _status = $v.status;
      _uid = $v.uid;
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionsRecord;
  }

  @override
  void update(void Function(TransactionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionsRecord build() => _build();

  _$TransactionsRecord _build() {
    final _$result = _$v ??
        new _$TransactionsRecord._(
            number: number,
            sms: sms,
            serviceProvider: serviceProvider,
            amount: amount,
            type: type,
            status: status,
            uid: uid,
            date: date,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
