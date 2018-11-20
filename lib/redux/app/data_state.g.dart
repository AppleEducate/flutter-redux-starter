// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_state.dart';

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

Serializer<DataState> _$dataStateSerializer = new _$DataStateSerializer();

class _$DataStateSerializer implements StructuredSerializer<DataState> {
  @override
  final Iterable<Type> types = const [DataState, _$DataState];
  @override
  final String wireName = 'DataState';

  @override
  Iterable serialize(Serializers serializers, DataState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'taskState',
      serializers.serialize(object.taskState,
          specifiedType: const FullType(TaskState)),
      'contactState',
      serializers.serialize(object.contactState,
          specifiedType: const FullType(ContactState)),
    ];

    return result;
  }

  @override
  DataState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'taskState':
          result.taskState.replace(serializers.deserialize(value,
              specifiedType: const FullType(TaskState)) as TaskState);
          break;
        case 'contactState':
          result.contactState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ContactState)) as ContactState);
          break;
      }
    }

    return result.build();
  }
}

class _$DataState extends DataState {
  @override
  final TaskState taskState;
  @override
  final ContactState contactState;

  factory _$DataState([void updates(DataStateBuilder b)]) =>
      (new DataStateBuilder()..update(updates)).build();

  _$DataState._({this.taskState, this.contactState}) : super._() {
    if (taskState == null) {
      throw new BuiltValueNullFieldError('DataState', 'taskState');
    }
    if (contactState == null) {
      throw new BuiltValueNullFieldError('DataState', 'contactState');
    }
  }

  @override
  DataState rebuild(void updates(DataStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DataStateBuilder toBuilder() => new DataStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataState &&
        taskState == other.taskState &&
        contactState == other.contactState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, taskState.hashCode), contactState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataState')
          ..add('taskState', taskState)
          ..add('contactState', contactState))
        .toString();
  }
}

class DataStateBuilder implements Builder<DataState, DataStateBuilder> {
  _$DataState _$v;

  TaskStateBuilder _taskState;
  TaskStateBuilder get taskState =>
      _$this._taskState ??= new TaskStateBuilder();
  set taskState(TaskStateBuilder taskState) => _$this._taskState = taskState;

  ContactStateBuilder _contactState;
  ContactStateBuilder get contactState =>
      _$this._contactState ??= new ContactStateBuilder();
  set contactState(ContactStateBuilder contactState) =>
      _$this._contactState = contactState;

  DataStateBuilder();

  DataStateBuilder get _$this {
    if (_$v != null) {
      _taskState = _$v.taskState?.toBuilder();
      _contactState = _$v.contactState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DataState;
  }

  @override
  void update(void updates(DataStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DataState build() {
    _$DataState _$result;
    try {
      _$result = _$v ??
          new _$DataState._(
              taskState: taskState.build(), contactState: contactState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'taskState';
        taskState.build();
        _$failedField = 'contactState';
        contactState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DataState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
