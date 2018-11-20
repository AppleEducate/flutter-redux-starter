// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<TaskEntity> _$taskEntitySerializer = new _$TaskEntitySerializer();

class _$TaskEntitySerializer implements StructuredSerializer<TaskEntity> {
  @override
  final Iterable<Type> types = const [TaskEntity, _$TaskEntity];
  @override
  final String wireName = 'TaskEntity';

  @override
  Iterable serialize(Serializers serializers, TaskEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'Lead_Task_Type',
      serializers.serialize(object.Lead_Task_Type,
          specifiedType: const FullType(String)),
      'Lead_Task_Title',
      serializers.serialize(object.Lead_Task_Title,
          specifiedType: const FullType(String)),
      'Lead_Task_Description',
      serializers.serialize(object.Lead_Task_Description,
          specifiedType: const FullType(String)),
      'Lead_Task_Time',
      serializers.serialize(object.Lead_Task_Time,
          specifiedType: const FullType(String)),
      'Alert_Time_Offset',
      serializers.serialize(object.Alert_Time_Offset,
          specifiedType: const FullType(String)),
      'Lead_Task_Status',
      serializers.serialize(object.Lead_Task_Status,
          specifiedType: const FullType(String)),
      'Lead_ID',
      serializers.serialize(object.Lead_ID,
          specifiedType: const FullType(String)),
      'Contact_ID',
      serializers.serialize(object.Contact_ID,
          specifiedType: const FullType(String)),
      'Core_Lead_ID',
      serializers.serialize(object.Core_Lead_ID,
          specifiedType: const FullType(String)),
      'Lead_Task_ID',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TaskEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Lead_Task_Type':
          result.Lead_Task_Type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Lead_Task_Title':
          result.Lead_Task_Title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Lead_Task_Description':
          result.Lead_Task_Description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Lead_Task_Time':
          result.Lead_Task_Time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Alert_Time_Offset':
          result.Alert_Time_Offset = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Lead_Task_Status':
          result.Lead_Task_Status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Lead_ID':
          result.Lead_ID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Contact_ID':
          result.Contact_ID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Core_Lead_ID':
          result.Core_Lead_ID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Lead_Task_ID':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TaskEntity extends TaskEntity {
  @override
  final String Lead_Task_Type;
  @override
  final String Lead_Task_Title;
  @override
  final String Lead_Task_Description;
  @override
  final String Lead_Task_Time;
  @override
  final String Alert_Time_Offset;
  @override
  final String Lead_Task_Status;
  @override
  final String Lead_ID;
  @override
  final String Contact_ID;
  @override
  final String Core_Lead_ID;
  @override
  final String id;

  factory _$TaskEntity([void updates(TaskEntityBuilder b)]) =>
      (new TaskEntityBuilder()..update(updates)).build();

  _$TaskEntity._(
      {this.Lead_Task_Type,
      this.Lead_Task_Title,
      this.Lead_Task_Description,
      this.Lead_Task_Time,
      this.Alert_Time_Offset,
      this.Lead_Task_Status,
      this.Lead_ID,
      this.Contact_ID,
      this.Core_Lead_ID,
      this.id})
      : super._() {
    if (Lead_Task_Type == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Lead_Task_Type');
    }
    if (Lead_Task_Title == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Lead_Task_Title');
    }
    if (Lead_Task_Description == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Lead_Task_Description');
    }
    if (Lead_Task_Time == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Lead_Task_Time');
    }
    if (Alert_Time_Offset == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Alert_Time_Offset');
    }
    if (Lead_Task_Status == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Lead_Task_Status');
    }
    if (Lead_ID == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Lead_ID');
    }
    if (Contact_ID == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Contact_ID');
    }
    if (Core_Lead_ID == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'Core_Lead_ID');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('TaskEntity', 'id');
    }
  }

  @override
  TaskEntity rebuild(void updates(TaskEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskEntityBuilder toBuilder() => new TaskEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskEntity &&
        Lead_Task_Type == other.Lead_Task_Type &&
        Lead_Task_Title == other.Lead_Task_Title &&
        Lead_Task_Description == other.Lead_Task_Description &&
        Lead_Task_Time == other.Lead_Task_Time &&
        Alert_Time_Offset == other.Alert_Time_Offset &&
        Lead_Task_Status == other.Lead_Task_Status &&
        Lead_ID == other.Lead_ID &&
        Contact_ID == other.Contact_ID &&
        Core_Lead_ID == other.Core_Lead_ID &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, Lead_Task_Type.hashCode),
                                        Lead_Task_Title.hashCode),
                                    Lead_Task_Description.hashCode),
                                Lead_Task_Time.hashCode),
                            Alert_Time_Offset.hashCode),
                        Lead_Task_Status.hashCode),
                    Lead_ID.hashCode),
                Contact_ID.hashCode),
            Core_Lead_ID.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaskEntity')
          ..add('Lead_Task_Type', Lead_Task_Type)
          ..add('Lead_Task_Title', Lead_Task_Title)
          ..add('Lead_Task_Description', Lead_Task_Description)
          ..add('Lead_Task_Time', Lead_Task_Time)
          ..add('Alert_Time_Offset', Alert_Time_Offset)
          ..add('Lead_Task_Status', Lead_Task_Status)
          ..add('Lead_ID', Lead_ID)
          ..add('Contact_ID', Contact_ID)
          ..add('Core_Lead_ID', Core_Lead_ID)
          ..add('id', id))
        .toString();
  }
}

class TaskEntityBuilder implements Builder<TaskEntity, TaskEntityBuilder> {
  _$TaskEntity _$v;

  String _Lead_Task_Type;
  String get Lead_Task_Type => _$this._Lead_Task_Type;
  set Lead_Task_Type(String Lead_Task_Type) =>
      _$this._Lead_Task_Type = Lead_Task_Type;

  String _Lead_Task_Title;
  String get Lead_Task_Title => _$this._Lead_Task_Title;
  set Lead_Task_Title(String Lead_Task_Title) =>
      _$this._Lead_Task_Title = Lead_Task_Title;

  String _Lead_Task_Description;
  String get Lead_Task_Description => _$this._Lead_Task_Description;
  set Lead_Task_Description(String Lead_Task_Description) =>
      _$this._Lead_Task_Description = Lead_Task_Description;

  String _Lead_Task_Time;
  String get Lead_Task_Time => _$this._Lead_Task_Time;
  set Lead_Task_Time(String Lead_Task_Time) =>
      _$this._Lead_Task_Time = Lead_Task_Time;

  String _Alert_Time_Offset;
  String get Alert_Time_Offset => _$this._Alert_Time_Offset;
  set Alert_Time_Offset(String Alert_Time_Offset) =>
      _$this._Alert_Time_Offset = Alert_Time_Offset;

  String _Lead_Task_Status;
  String get Lead_Task_Status => _$this._Lead_Task_Status;
  set Lead_Task_Status(String Lead_Task_Status) =>
      _$this._Lead_Task_Status = Lead_Task_Status;

  String _Lead_ID;
  String get Lead_ID => _$this._Lead_ID;
  set Lead_ID(String Lead_ID) => _$this._Lead_ID = Lead_ID;

  String _Contact_ID;
  String get Contact_ID => _$this._Contact_ID;
  set Contact_ID(String Contact_ID) => _$this._Contact_ID = Contact_ID;

  String _Core_Lead_ID;
  String get Core_Lead_ID => _$this._Core_Lead_ID;
  set Core_Lead_ID(String Core_Lead_ID) => _$this._Core_Lead_ID = Core_Lead_ID;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  TaskEntityBuilder();

  TaskEntityBuilder get _$this {
    if (_$v != null) {
      _Lead_Task_Type = _$v.Lead_Task_Type;
      _Lead_Task_Title = _$v.Lead_Task_Title;
      _Lead_Task_Description = _$v.Lead_Task_Description;
      _Lead_Task_Time = _$v.Lead_Task_Time;
      _Alert_Time_Offset = _$v.Alert_Time_Offset;
      _Lead_Task_Status = _$v.Lead_Task_Status;
      _Lead_ID = _$v.Lead_ID;
      _Contact_ID = _$v.Contact_ID;
      _Core_Lead_ID = _$v.Core_Lead_ID;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TaskEntity;
  }

  @override
  void update(void updates(TaskEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TaskEntity build() {
    final _$result = _$v ??
        new _$TaskEntity._(
            Lead_Task_Type: Lead_Task_Type,
            Lead_Task_Title: Lead_Task_Title,
            Lead_Task_Description: Lead_Task_Description,
            Lead_Task_Time: Lead_Task_Time,
            Alert_Time_Offset: Alert_Time_Offset,
            Lead_Task_Status: Lead_Task_Status,
            Lead_ID: Lead_ID,
            Contact_ID: Contact_ID,
            Core_Lead_ID: Core_Lead_ID,
            id: id);
    replace(_$result);
    return _$result;
  }
}
