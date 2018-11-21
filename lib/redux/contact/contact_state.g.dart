// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_state.dart';

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

Serializer<ContactState> _$contactStateSerializer =
    new _$ContactStateSerializer();
Serializer<ContactUIState> _$contactUIStateSerializer =
    new _$ContactUIStateSerializer();

class _$ContactStateSerializer implements StructuredSerializer<ContactState> {
  @override
  final Iterable<Type> types = const [ContactState, _$ContactState];
  @override
  final String wireName = 'ContactState';

  @override
  Iterable serialize(Serializers serializers, ContactState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(ContactEntity)])),
      'list',
      serializers.serialize(object.list,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.lastUpdated != null) {
      result
        ..add('lastUpdated')
        ..add(serializers.serialize(object.lastUpdated,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  ContactState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'lastUpdated':
          result.lastUpdated = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(ContactEntity)
              ])) as BuiltMap);
          break;
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ContactUIStateSerializer
    implements StructuredSerializer<ContactUIState> {
  @override
  final Iterable<Type> types = const [ContactUIState, _$ContactUIState];
  @override
  final String wireName = 'ContactUIState';

  @override
  Iterable serialize(Serializers serializers, ContactUIState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'listUIState',
      serializers.serialize(object.listUIState,
          specifiedType: const FullType(ListUIState)),
    ];
    if (object.selected != null) {
      result
        ..add('selected')
        ..add(serializers.serialize(object.selected,
            specifiedType: const FullType(ContactEntity)));
    }

    return result;
  }

  @override
  ContactUIState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactUIStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'selected':
          result.selected.replace(serializers.deserialize(value,
              specifiedType: const FullType(ContactEntity)) as ContactEntity);
          break;
        case 'listUIState':
          result.listUIState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ListUIState)) as ListUIState);
          break;
      }
    }

    return result.build();
  }
}

class _$ContactState extends ContactState {
  @override
  final int lastUpdated;
  @override
  final BuiltMap<String, ContactEntity> map;
  @override
  final BuiltList<String> list;
  @override
  final PagingModel paging;

  factory _$ContactState([void updates(ContactStateBuilder b)]) =>
      (new ContactStateBuilder()..update(updates)).build();

  _$ContactState._({this.lastUpdated, this.map, this.list, this.paging})
      : super._() {
    if (map == null) {
      throw new BuiltValueNullFieldError('ContactState', 'map');
    }
    if (list == null) {
      throw new BuiltValueNullFieldError('ContactState', 'list');
    }
  }

  @override
  ContactState rebuild(void updates(ContactStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactStateBuilder toBuilder() => new ContactStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactState &&
        lastUpdated == other.lastUpdated &&
        map == other.map &&
        list == other.list &&
        paging == other.paging;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, paging.hashCode), lastUpdated.hashCode), map.hashCode),
        list.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactState')
          ..add('lastUpdated', lastUpdated)
          ..add('map', map)
          ..add('list', list))
        .toString();
  }
}

class ContactStateBuilder
    implements Builder<ContactState, ContactStateBuilder> {
  _$ContactState _$v;

  int _lastUpdated;
  int get lastUpdated => _$this._lastUpdated;
  set lastUpdated(int lastUpdated) => _$this._lastUpdated = lastUpdated;

  MapBuilder<String, ContactEntity> _map;
  MapBuilder<String, ContactEntity> get map =>
      _$this._map ??= new MapBuilder<String, ContactEntity>();
  set map(MapBuilder<String, ContactEntity> map) => _$this._map = map;

  ListBuilder<String> _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String> list) => _$this._list = list;

  PagingModel _paging;
  PagingModel get paging => _$this._paging;
  set paging(PagingModel paging) => _$this._paging = paging;

  ContactStateBuilder();

  ContactStateBuilder get _$this {
    if (_$v != null) {
      _lastUpdated = _$v.lastUpdated;
      _paging = _$v.paging;
      _map = _$v.map?.toBuilder();
      _list = _$v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactState;
  }

  @override
  void update(void updates(ContactStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactState build() {
    _$ContactState _$result;
    try {
      _$result = _$v ??
          new _$ContactState._(
              lastUpdated: lastUpdated, map: map.build(), list: list.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
        _$failedField = 'list';
        list.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContactState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ContactUIState extends ContactUIState {
  @override
  final ContactEntity selected;
  @override
  final ListUIState listUIState;

  factory _$ContactUIState([void updates(ContactUIStateBuilder b)]) =>
      (new ContactUIStateBuilder()..update(updates)).build();

  _$ContactUIState._({this.selected, this.listUIState}) : super._() {
    if (listUIState == null) {
      throw new BuiltValueNullFieldError('ContactUIState', 'listUIState');
    }
  }

  @override
  ContactUIState rebuild(void updates(ContactUIStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactUIStateBuilder toBuilder() =>
      new ContactUIStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactUIState &&
        selected == other.selected &&
        listUIState == other.listUIState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, selected.hashCode), listUIState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactUIState')
          ..add('selected', selected)
          ..add('listUIState', listUIState))
        .toString();
  }
}

class ContactUIStateBuilder
    implements Builder<ContactUIState, ContactUIStateBuilder> {
  _$ContactUIState _$v;

  ContactEntityBuilder _selected;
  ContactEntityBuilder get selected =>
      _$this._selected ??= new ContactEntityBuilder();
  set selected(ContactEntityBuilder selected) => _$this._selected = selected;

  ListUIStateBuilder _listUIState;
  ListUIStateBuilder get listUIState =>
      _$this._listUIState ??= new ListUIStateBuilder();
  set listUIState(ListUIStateBuilder listUIState) =>
      _$this._listUIState = listUIState;

  ContactUIStateBuilder();

  ContactUIStateBuilder get _$this {
    if (_$v != null) {
      _selected = _$v.selected?.toBuilder();
      _listUIState = _$v.listUIState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactUIState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactUIState;
  }

  @override
  void update(void updates(ContactUIStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactUIState build() {
    _$ContactUIState _$result;
    try {
      _$result = _$v ??
          new _$ContactUIState._(
              selected: _selected?.build(), listUIState: listUIState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selected';
        _selected?.build();
        _$failedField = 'listUIState';
        listUIState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContactUIState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
