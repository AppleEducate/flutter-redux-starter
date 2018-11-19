import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
//import 'package:MyUnifyMobile/ui/app/dismissible_entity.dart';
import '../../widgets/three_row_tile.dart';
import 'package:intl/intl.dart';

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

    // return ListTile(
    //   onTap: onTap,
    //   title: Container(
    //     width: MediaQuery.of(context).size.width,
    //     // child: Row(
    //     //   children: <Widget>[
    //     //     Expanded(
    //     //       child: Text(
    //     //         contact.displayName,
    //     //         style: Theme.of(context).textTheme.title,
    //     //       ),
    //     //     ),
    //     //   ],
    //     // ),

    //   ),
    //   // STARTER: subtitle - do not remove comment
    //   subtitle: Text(contact.last_name, maxLines: 4),
    // );

    return ThreeRowTile(
      width: MediaQuery.of(context).size.width,
      iconTap: onTap,
      icon: Icon(Icons.person),
      title: Text(
        contact.displayName,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        contact?.last_activity ?? "",
        style: Theme.of(context).textTheme.subtitle,
      ),
      onTap: onTap,
      cell: contact?.cell_phone,
      home: contact?.cell_phone,
      office: contact?.cell_phone,
      email: contact?.email,
      box1: Utility(
        value: DateFormat('MM-dd-yy')
            .format(DateTime.parse(contact?.date_created)),
        hint: "Date Created",
      ),
      box2: Utility(
        value: DateFormat('MM-dd-yy')
            .format(DateTime.parse(contact?.date_modified)),
        hint: "Date Modified",
      ),
    );
  }
}
