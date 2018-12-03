// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

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

Serializer<GroupEntity> _$groupEntitySerializer = new _$GroupEntitySerializer();

class _$GroupEntitySerializer implements StructuredSerializer<GroupEntity> {
  @override
  final Iterable<Type> types = const [GroupEntity, _$GroupEntity];
  @override
  final String wireName = 'GroupEntity';

  @override
  Iterable serialize(Serializers serializers, GroupEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GroupEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GroupEntity extends GroupEntity {
  @override
  final String name;
  @override
  final String id;

  factory _$GroupEntity([void updates(GroupEntityBuilder b)]) =>
      (new GroupEntityBuilder()..update(updates)).build();

  _$GroupEntity._({this.name, this.id}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GroupEntity', 'name');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GroupEntity', 'id');
    }
  }

  @override
  GroupEntity rebuild(void updates(GroupEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupEntityBuilder toBuilder() => new GroupEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupEntity && name == other.name && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupEntity')
          ..add('name', name)
          ..add('id', id))
        .toString();
  }
}

class GroupEntityBuilder implements Builder<GroupEntity, GroupEntityBuilder> {
  _$GroupEntity _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  GroupEntityBuilder();

  GroupEntityBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GroupEntity;
  }

  @override
  void update(void updates(GroupEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupEntity build() {
    final _$result = _$v ?? new _$GroupEntity._(name: name, id: id);
    replace(_$result);
    return _$result;
  }
}
