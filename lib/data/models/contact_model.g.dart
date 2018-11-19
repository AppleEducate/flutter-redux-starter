// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

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

Serializer<ContactEntity> _$contactEntitySerializer =
    new _$ContactEntitySerializer();

class _$ContactEntitySerializer implements StructuredSerializer<ContactEntity> {
  @override
  final Iterable<Type> types = const [ContactEntity, _$ContactEntity];
  @override
  final String wireName = 'ContactEntity';

  @override
  Iterable serialize(Serializers serializers, ContactEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'first_name',
      serializers.serialize(object.first_name,
          specifiedType: const FullType(String)),
      'last_name',
      serializers.serialize(object.last_name,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'contact_id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ContactEntity deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'first_name':
          result.first_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.last_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactEntity extends ContactEntity {
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String email;
  @override
  final String id;

  factory _$ContactEntity([void updates(ContactEntityBuilder b)]) =>
      (new ContactEntityBuilder()..update(updates)).build();

  _$ContactEntity._({this.first_name, this.last_name, this.email, this.id})
      : super._() {
    if (first_name == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'first_name');
    }
    if (last_name == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'last_name');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'email');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'id');
    }
  }

  @override
  ContactEntity rebuild(void updates(ContactEntityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactEntityBuilder toBuilder() => new ContactEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactEntity &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        email == other.email &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, first_name.hashCode), last_name.hashCode),
            email.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactEntity')
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('email', email)
          ..add('id', id))
        .toString();
  }
}

class ContactEntityBuilder
    implements Builder<ContactEntity, ContactEntityBuilder> {
  _$ContactEntity _$v;

  String _first_name;
  String get first_name => _$this._first_name;
  set first_name(String first_name) => _$this._first_name = first_name;

  String _last_name;
  String get last_name => _$this._last_name;
  set last_name(String last_name) => _$this._last_name = last_name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  ContactEntityBuilder();

  ContactEntityBuilder get _$this {
    if (_$v != null) {
      _first_name = _$v.first_name;
      _last_name = _$v.last_name;
      _email = _$v.email;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactEntity;
  }

  @override
  void update(void updates(ContactEntityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactEntity build() {
    final _$result = _$v ??
        new _$ContactEntity._(
            first_name: first_name, last_name: last_name, email: email, id: id);
    replace(_$result);
    return _$result;
  }
}
