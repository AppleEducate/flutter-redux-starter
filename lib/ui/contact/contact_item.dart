import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
//import 'package:MyUnifyMobile/ui/app/dismissible_entity.dart';

class ContactItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ContactEntity contact;

  static final contactItemKey = (int id) => Key('__contact_item_${id}__');

  ContactItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    /*
    return DismissibleEntity(
      entity: contact,
      onDismissed: onDismissed,
      onTap: onTap,
      child: ListTile(
        onTap: onTap,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  contact.displayName,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ),
        // STARTER: subtitle - do not remove comment
subtitle: Text(contact.last_name, maxLines: 4),

      ),
    );
  }
  */

    return ListTile(
      onTap: onTap,
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                contact.displayName,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
      // STARTER: subtitle - do not remove comment
      subtitle: Text(contact.last_name, maxLines: 4),
    );
  }
}
