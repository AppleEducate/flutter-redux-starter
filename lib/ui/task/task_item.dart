import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
//import 'package:MyUnifyMobile/ui/app/dismissible_entity.dart';

class TaskItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final TaskEntity task;

  static final taskItemKey = (int id) => Key('__task_item_${id}__');

  TaskItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.task,
  });

  @override
  Widget build(BuildContext context) {
    /*
    return DismissibleEntity(
      entity: task,
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
                  task.displayName,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ),
        // STARTER: subtitle - do not remove comment
subtitle: Text(task.Lead_Task_Title, maxLines: 4),

      ),
    );
  }
  */

    return ListTile(
      onTap: onTap,
      title: Text(
        task.Lead_Task_Title,
        style: Theme.of(context).textTheme.title,
      ),
      // STARTER: subtitle - do not remove comment
      subtitle: Text(task.Lead_Task_Description, maxLines: 4),
    );
  }
}
