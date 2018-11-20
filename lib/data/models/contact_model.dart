import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:MyUnifyMobile/data/models/models.dart';

part 'contact_model.g.dart';

class ContactFields {
  // STARTER: fields - do not remove comment
  static const String first_name = 'First Name';

  static const String last_name = 'Last Name';

  static const String cell_phone = 'Cell Phone';

  static const String office_phone = 'Office Phone';

  static const String home_phone = 'Home Phone';

  static const String date_created = 'Date Created';

  static const String date_modified = 'Date Modified';

  static const String email = 'Email';

  static const String last_activity = 'Last Activity';
}

abstract class ContactEntity extends Object
    with BaseEntity
    implements Built<ContactEntity, ContactEntityBuilder> {
  // STARTER: properties - do not remove comment
  String get first_name;

  String get last_name;

  String get cell_phone;

  String get office_phone;

  String get home_phone;

  String get date_created;

  String get date_modified;

  String get email;

  String get last_activity;

  static int counter = 0;
  factory ContactEntity() {
    return _$ContactEntity._(
      id: '',
      // STARTER: constructor - do not remove comment
      first_name: '',

      last_name: '',

      cell_phone: '',

      office_phone: '',

      home_phone: '',

      date_created: '',

      date_modified: '',

      email: '',

      last_activity: '',
    );
  }

  String get displayName {
    // STARTER: display name - do not remove comment
    return "$first_name $last_name";
  }

  String get lastFirstName {
    // STARTER: display name - do not remove comment
    return "$last_name, $first_name";
  }

  int compareTo(ContactEntity contact, String sortField, bool sortAscending) {
    int response = 0;
    ContactEntity contactA = sortAscending ? this : contact;
    ContactEntity contactB = sortAscending ? contact : this;

    switch (sortField) {
      // STARTER: sort switch - do not remove comment
      case ContactFields.first_name:
        response = contactA.first_name.compareTo(contactB.first_name);
        break;

      case ContactFields.last_name:
        response = contactA.last_name.compareTo(contactB.last_name);
        break;

      case ContactFields.cell_phone:
        response = contactA.cell_phone.compareTo(contactB.cell_phone);
        break;

      case ContactFields.office_phone:
        response = contactA.office_phone.compareTo(contactB.office_phone);
        break;

      case ContactFields.home_phone:
        response = contactA.home_phone.compareTo(contactB.home_phone);
        break;

      case ContactFields.date_created:
        response = contactA.date_created.compareTo(contactB.date_created);
        break;

      case ContactFields.date_modified:
        response = contactA.date_modified.compareTo(contactB.date_modified);
        break;

      case ContactFields.email:
        response = contactA.email.compareTo(contactB.email);
        break;

      case ContactFields.last_activity:
        response = contactA.last_activity.compareTo(contactB.last_activity);
        break;
    }

    if (response == 0) {
      // STARTER: sort default - do not remove comment
      return contactA.first_name.compareTo(contactB.first_name);
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
    if (first_name.toLowerCase().contains(search)) {
      return true;
    }

    if (last_name.toLowerCase().contains(search)) {
      return true;
    }

    if (cell_phone.toLowerCase().contains(search)) {
      return true;
    }

    if (office_phone.toLowerCase().contains(search)) {
      return true;
    }

    if (home_phone.toLowerCase().contains(search)) {
      return true;
    }

    if (date_created.toLowerCase().contains(search)) {
      return true;
    }

    if (date_modified.toLowerCase().contains(search)) {
      return true;
    }

    if (email.toLowerCase().contains(search)) {
      return true;
    }

    if (last_activity.toLowerCase().contains(search)) {
      return true;
    }

    return false;
  }

  ContactEntity._();
  static Serializer<ContactEntity> get serializer => _$contactEntitySerializer;
}
