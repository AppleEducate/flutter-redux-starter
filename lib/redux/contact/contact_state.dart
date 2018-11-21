import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/constants.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
import 'package:MyUnifyMobile/redux/ui/entity_ui_state.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';
import '../../data/models/paging_model.dart';
part 'contact_state.g.dart';

abstract class ContactState
    implements Built<ContactState, ContactStateBuilder> {
  @nullable
  int get lastUpdated;

  BuiltMap<String, ContactEntity> get map;
  BuiltList<String> get list;

  @nullable
  PagingModel get paging;

  factory ContactState() {
    return _$ContactState._(
      map: BuiltMap<String, ContactEntity>(),
      list: BuiltList<String>(),
      paging: PagingModel(rows: 100, page: 1),
    );
  }

  bool get isStale {
    if (!isLoaded) {
      return true;
    }

    return DateTime.now().millisecondsSinceEpoch - lastUpdated >
        kMillisecondsToRefreshData;
  }

  bool get isLoaded {
    return lastUpdated != null;
  }

  ContactState._();
  static Serializer<ContactState> get serializer => _$contactStateSerializer;
}

abstract class ContactUIState extends Object
    with EntityUIState
    implements Built<ContactUIState, ContactUIStateBuilder> {
  @nullable
  ContactEntity get selected;

  bool get isSelectedNew => selected.isNew;

  factory ContactUIState() {
    return _$ContactUIState._(
      listUIState: ListUIState(''),
      selected: ContactEntity(),
    );
  }

  ContactUIState._();
  static Serializer<ContactUIState> get serializer =>
      _$contactUIStateSerializer;
}
