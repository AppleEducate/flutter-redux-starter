import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
//import 'package:MyUnifyMobile/ui/app/dismissible_entity.dart';

class GroupItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final GroupEntity group;

  static final groupItemKey = (int id) => Key('__group_item_${id}__');

  GroupItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.group,
  });

  @override
  Widget build(BuildContext context) {
    /*
    return DismissibleEntity(
      entity: group,
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
                  group.displayName,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ),
        // STARTER: subtitle - do not remove comment
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
                group.displayName,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
      // STARTER: subtitle - do not remove comment
    );
  }
}
