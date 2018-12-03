// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_state.dart';

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

Serializer<GroupState> _$groupStateSerializer = new _$GroupStateSerializer();
Serializer<GroupUIState> _$groupUIStateSerializer =
    new _$GroupUIStateSerializer();

class _$GroupStateSerializer implements StructuredSerializer<GroupState> {
  @override
  final Iterable<Type> types = const [GroupState, _$GroupState];
  @override
  final String wireName = 'GroupState';

  @override
  Iterable serialize(Serializers serializers, GroupState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(GroupEntity)])),
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
  GroupState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupStateBuilder();

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
                const FullType(GroupEntity)
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

class _$GroupUIStateSerializer implements StructuredSerializer<GroupUIState> {
  @override
  final Iterable<Type> types = const [GroupUIState, _$GroupUIState];
  @override
  final String wireName = 'GroupUIState';

  @override
  Iterable serialize(Serializers serializers, GroupUIState object,
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
            specifiedType: const FullType(GroupEntity)));
    }

    return result;
  }

  @override
  GroupUIState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupUIStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'selected':
          result.selected.replace(serializers.deserialize(value,
              specifiedType: const FullType(GroupEntity)) as GroupEntity);
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

class _$GroupState extends GroupState {
  @override
  final int lastUpdated;
  @override
  final BuiltMap<String, GroupEntity> map;
  @override
  final BuiltList<String> list;

  factory _$GroupState([void updates(GroupStateBuilder b)]) =>
      (new GroupStateBuilder()..update(updates)).build();

  _$GroupState._({this.lastUpdated, this.map, this.list}) : super._() {
    if (map == null) {
      throw new BuiltValueNullFieldError('GroupState', 'map');
    }
    if (list == null) {
      throw new BuiltValueNullFieldError('GroupState', 'list');
    }
  }

  @override
  GroupState rebuild(void updates(GroupStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupStateBuilder toBuilder() => new GroupStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupState &&
        lastUpdated == other.lastUpdated &&
        map == other.map &&
        list == other.list;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, lastUpdated.hashCode), map.hashCode), list.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupState')
          ..add('lastUpdated', lastUpdated)
          ..add('map', map)
          ..add('list', list))
        .toString();
  }
}

class GroupStateBuilder implements Builder<GroupState, GroupStateBuilder> {
  _$GroupState _$v;

  int _lastUpdated;
  int get lastUpdated => _$this._lastUpdated;
  set lastUpdated(int lastUpdated) => _$this._lastUpdated = lastUpdated;

  MapBuilder<String, GroupEntity> _map;
  MapBuilder<String, GroupEntity> get map =>
      _$this._map ??= new MapBuilder<String, GroupEntity>();
  set map(MapBuilder<String, GroupEntity> map) => _$this._map = map;

  ListBuilder<String> _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String> list) => _$this._list = list;

  GroupStateBuilder();

  GroupStateBuilder get _$this {
    if (_$v != null) {
      _lastUpdated = _$v.lastUpdated;
      _map = _$v.map?.toBuilder();
      _list = _$v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GroupState;
  }

  @override
  void update(void updates(GroupStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupState build() {
    _$GroupState _$result;
    try {
      _$result = _$v ??
          new _$GroupState._(
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
            'GroupState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GroupUIState extends GroupUIState {
  @override
  final GroupEntity selected;
  @override
  final ListUIState listUIState;

  factory _$GroupUIState([void updates(GroupUIStateBuilder b)]) =>
      (new GroupUIStateBuilder()..update(updates)).build();

  _$GroupUIState._({this.selected, this.listUIState}) : super._() {
    if (listUIState == null) {
      throw new BuiltValueNullFieldError('GroupUIState', 'listUIState');
    }
  }

  @override
  GroupUIState rebuild(void updates(GroupUIStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupUIStateBuilder toBuilder() => new GroupUIStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupUIState &&
        selected == other.selected &&
        listUIState == other.listUIState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, selected.hashCode), listUIState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GroupUIState')
          ..add('selected', selected)
          ..add('listUIState', listUIState))
        .toString();
  }
}

class GroupUIStateBuilder
    implements Builder<GroupUIState, GroupUIStateBuilder> {
  _$GroupUIState _$v;

  GroupEntityBuilder _selected;
  GroupEntityBuilder get selected =>
      _$this._selected ??= new GroupEntityBuilder();
  set selected(GroupEntityBuilder selected) => _$this._selected = selected;

  ListUIStateBuilder _listUIState;
  ListUIStateBuilder get listUIState =>
      _$this._listUIState ??= new ListUIStateBuilder();
  set listUIState(ListUIStateBuilder listUIState) =>
      _$this._listUIState = listUIState;

  GroupUIStateBuilder();

  GroupUIStateBuilder get _$this {
    if (_$v != null) {
      _selected = _$v.selected?.toBuilder();
      _listUIState = _$v.listUIState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupUIState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GroupUIState;
  }

  @override
  void update(void updates(GroupUIStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GroupUIState build() {
    _$GroupUIState _$result;
    try {
      _$result = _$v ??
          new _$GroupUIState._(
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
            'GroupUIState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
