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
      'cell_phone',
      serializers.serialize(object.cell_phone,
          specifiedType: const FullType(String)),
      'office_phone',
      serializers.serialize(object.office_phone,
          specifiedType: const FullType(String)),
      'home_phone',
      serializers.serialize(object.home_phone,
          specifiedType: const FullType(String)),
      'date_created',
      serializers.serialize(object.date_created,
          specifiedType: const FullType(String)),
      'date_modified',
      serializers.serialize(object.date_modified,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'last_activity',
      serializers.serialize(object.last_activity,
          specifiedType: const FullType(String)),
      'id',
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
        case 'cell_phone':
          result.cell_phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'office_phone':
          result.office_phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'home_phone':
          result.home_phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_created':
          result.date_created = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_modified':
          result.date_modified = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_activity':
          result.last_activity = serializers.deserialize(value,
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

class _$ContactEntity extends ContactEntity {
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String cell_phone;
  @override
  final String office_phone;
  @override
  final String home_phone;
  @override
  final String date_created;
  @override
  final String date_modified;
  @override
  final String email;
  @override
  final String last_activity;
  @override
  final String id;

  factory _$ContactEntity([void updates(ContactEntityBuilder b)]) =>
      (new ContactEntityBuilder()..update(updates)).build();

  _$ContactEntity._(
      {this.first_name,
      this.last_name,
      this.cell_phone,
      this.office_phone,
      this.home_phone,
      this.date_created,
      this.date_modified,
      this.email,
      this.last_activity,
      this.id})
      : super._() {
    if (first_name == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'first_name');
    }
    if (last_name == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'last_name');
    }
    if (cell_phone == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'cell_phone');
    }
    if (office_phone == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'office_phone');
    }
    if (home_phone == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'home_phone');
    }
    if (date_created == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'date_created');
    }
    if (date_modified == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'date_modified');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'email');
    }
    if (last_activity == null) {
      throw new BuiltValueNullFieldError('ContactEntity', 'last_activity');
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
        cell_phone == other.cell_phone &&
        office_phone == other.office_phone &&
        home_phone == other.home_phone &&
        date_created == other.date_created &&
        date_modified == other.date_modified &&
        email == other.email &&
        last_activity == other.last_activity &&
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
                                    $jc($jc(0, first_name.hashCode),
                                        last_name.hashCode),
                                    cell_phone.hashCode),
                                office_phone.hashCode),
                            home_phone.hashCode),
                        date_created.hashCode),
                    date_modified.hashCode),
                email.hashCode),
            last_activity.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactEntity')
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('cell_phone', cell_phone)
          ..add('office_phone', office_phone)
          ..add('home_phone', home_phone)
          ..add('date_created', date_created)
          ..add('date_modified', date_modified)
          ..add('email', email)
          ..add('last_activity', last_activity)
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

  String _cell_phone;
  String get cell_phone => _$this._cell_phone;
  set cell_phone(String cell_phone) => _$this._cell_phone = cell_phone;

  String _office_phone;
  String get office_phone => _$this._office_phone;
  set office_phone(String office_phone) => _$this._office_phone = office_phone;

  String _home_phone;
  String get home_phone => _$this._home_phone;
  set home_phone(String home_phone) => _$this._home_phone = home_phone;

  String _date_created;
  String get date_created => _$this._date_created;
  set date_created(String date_created) => _$this._date_created = date_created;

  String _date_modified;
  String get date_modified => _$this._date_modified;
  set date_modified(String date_modified) =>
      _$this._date_modified = date_modified;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _last_activity;
  String get last_activity => _$this._last_activity;
  set last_activity(String last_activity) =>
      _$this._last_activity = last_activity;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  ContactEntityBuilder();

  ContactEntityBuilder get _$this {
    if (_$v != null) {
      _first_name = _$v.first_name;
      _last_name = _$v.last_name;
      _cell_phone = _$v.cell_phone;
      _office_phone = _$v.office_phone;
      _home_phone = _$v.home_phone;
      _date_created = _$v.date_created;
      _date_modified = _$v.date_modified;
      _email = _$v.email;
      _last_activity = _$v.last_activity;
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
            first_name: first_name,
            last_name: last_name,
            cell_phone: cell_phone,
            office_phone: office_phone,
            home_phone: home_phone,
            date_created: date_created,
            date_modified: date_modified,
            email: email,
            last_activity: last_activity,
            id: id);
    replace(_$result);
    return _$result;
  }
}
