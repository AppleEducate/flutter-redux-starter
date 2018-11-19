import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:MyUnifyMobile/data/models/models.dart';

part 'contact_model.g.dart';

class ContactFields {
  // STARTER: fields - do not remove comment
static const String first_name = 'first_name';

static const String last_name = 'last_name';

static const String email = 'email';

}

abstract class ContactEntity extends Object with BaseEntity implements Built<ContactEntity, ContactEntityBuilder> {

  // STARTER: properties - do not remove comment
String get first_name;

String get last_name;

String get email;


  static int counter = 0;
  factory ContactEntity() {
    return _$ContactEntity._(
      id: 0,
      // STARTER: constructor - do not remove comment
first_name: '',

last_name: '',

email: '',

    );
  }

  String get displayName {
    // STARTER: display name - do not remove comment
return first_name;

  }

  int compareTo(ContactEntity contact, String sortField, bool sortAscending) {
    int response = 0;
    ContactEntity contactA = sortAscending ? this : contact;
    ContactEntity contactB = sortAscending ? contact: this; 

    switch (sortField) {
      // STARTER: sort switch - do not remove comment
case ContactFields.first_name:
response = contactA.first_name.compareTo(contactB.first_name);
break;

case ContactFields.last_name:
response = contactA.last_name.compareTo(contactB.last_name);
break;

case ContactFields.email:
response = contactA.email.compareTo(contactB.email);
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
if (first_name.toLowerCase().contains(search)){
return true;
}

if (last_name.toLowerCase().contains(search)){
return true;
}

if (email.toLowerCase().contains(search)){
return true;
}


    return false;
  }

  ContactEntity._();
  static Serializer<ContactEntity> get serializer => _$contactEntitySerializer;
}
