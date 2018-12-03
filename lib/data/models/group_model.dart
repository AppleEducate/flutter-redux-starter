import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:MyUnifyMobile/data/models/models.dart';

part 'group_model.g.dart';

class GroupFields {
  // STARTER: fields - do not remove comment
  static const String name = 'name';
}

abstract class GroupEntity extends Object
    with BaseEntity
    implements Built<GroupEntity, GroupEntityBuilder> {
  // STARTER: properties - do not remove comment
  String get name;

  static int counter = 0;
  factory GroupEntity() {
    return _$GroupEntity._(
      id: '',
      // STARTER: constructor - do not remove comment
      name: '',
    );
  }

  String get displayName {
    // STARTER: display name - do not remove comment
    return name;
  }

  int compareTo(GroupEntity group, String sortField, bool sortAscending) {
    int response = 0;
    GroupEntity groupA = sortAscending ? this : group;
    GroupEntity groupB = sortAscending ? group : this;

    switch (sortField) {
      // STARTER: sort switch - do not remove comment
      case GroupFields.name:
        response = groupA.name.compareTo(groupB.name);
        break;
    }

    if (response == 0) {
      // STARTER: sort default - do not remove comment
      return groupA.name.compareTo(groupB.name);
    } else {
      return response;
    }
  }

  bool matchesSearch(String search) {
    if (search == null || search.isEmpty) {
      return true;
    }

    search = search.toLowerCase();

    // STARTER: search - do not remove comment
    if (name.toLowerCase().contains(search)) {
      return true;
    }

    return false;
  }

  GroupEntity._();
  static Serializer<GroupEntity> get serializer => _$groupEntitySerializer;
}
