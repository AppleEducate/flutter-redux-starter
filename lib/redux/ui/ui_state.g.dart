// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_state.dart';

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

Serializer<UIState> _$uIStateSerializer = new _$UIStateSerializer();

class _$UIStateSerializer implements StructuredSerializer<UIState> {
  @override
  final Iterable<Type> types = const [UIState, _$UIState];
  @override
  final String wireName = 'UIState';

  @override
  Iterable serialize(Serializers serializers, UIState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currentRoute',
      serializers.serialize(object.currentRoute,
          specifiedType: const FullType(String)),
      'contactUIState',
      serializers.serialize(object.contactUIState,
          specifiedType: const FullType(ContactUIState)),
    ];

    return result;
  }

  @override
  UIState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UIStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currentRoute':
          result.currentRoute = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contactUIState':
          result.contactUIState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ContactUIState)) as ContactUIState);
          break;
      }
    }

    return result.build();
  }
}

class _$UIState extends UIState {
  @override
  final String currentRoute;
  @override
  final ContactUIState contactUIState;

  factory _$UIState([void updates(UIStateBuilder b)]) =>
      (new UIStateBuilder()..update(updates)).build();

  _$UIState._({this.currentRoute, this.contactUIState}) : super._() {
    if (currentRoute == null) {
      throw new BuiltValueNullFieldError('UIState', 'currentRoute');
    }
    if (contactUIState == null) {
      throw new BuiltValueNullFieldError('UIState', 'contactUIState');
    }
  }

  @override
  UIState rebuild(void updates(UIStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UIStateBuilder toBuilder() => new UIStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UIState &&
        currentRoute == other.currentRoute &&
        contactUIState == other.contactUIState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, currentRoute.hashCode), contactUIState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UIState')
          ..add('currentRoute', currentRoute)
          ..add('contactUIState', contactUIState))
        .toString();
  }
}

class UIStateBuilder implements Builder<UIState, UIStateBuilder> {
  _$UIState _$v;

  String _currentRoute;
  String get currentRoute => _$this._currentRoute;
  set currentRoute(String currentRoute) => _$this._currentRoute = currentRoute;

  ContactUIStateBuilder _contactUIState;
  ContactUIStateBuilder get contactUIState =>
      _$this._contactUIState ??= new ContactUIStateBuilder();
  set contactUIState(ContactUIStateBuilder contactUIState) =>
      _$this._contactUIState = contactUIState;

  UIStateBuilder();

  UIStateBuilder get _$this {
    if (_$v != null) {
      _currentRoute = _$v.currentRoute;
      _contactUIState = _$v.contactUIState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UIState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UIState;
  }

  @override
  void update(void updates(UIStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UIState build() {
    _$UIState _$result;
    try {
      _$result = _$v ??
          new _$UIState._(
              currentRoute: currentRoute,
              contactUIState: contactUIState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'contactUIState';
        contactUIState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UIState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
