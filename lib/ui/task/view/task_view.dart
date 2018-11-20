import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/app/actions_menu_button.dart';
import 'package:MyUnifyMobile/ui/task/view/task_view_vm.dart';
import 'package:MyUnifyMobile/ui/app/form_card.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import '../../../utils/date_formatter.dart';

class TaskView extends StatefulWidget {
  final TaskViewVM viewModel;

  TaskView({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _TaskViewState createState() => new _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    var viewModel = widget.viewModel;
    var task = viewModel.task;

    return Scaffold(
      appBar: AppBar(
        title: Text(task.displayName),
        actions: task.isNew
            ? []
            : [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    viewModel.onEditPressed(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.event_available),
                  onPressed: () {
                    var _date = parseDate(task.Lead_Task_Time);
                    final Event event = Event(
                      title: task?.Lead_Task_Title ?? "",
                      description: task?.Lead_Task_Description ?? "",
                      startDate: _date,
                      endDate: _date.add(Duration(minutes: 30)),
                    );
                    print("Adding Event: $_date ${task?.Lead_Task_Title}");
                    Add2Calendar.addEvent2Cal(event);
                  },
                ),
                ActionMenuButton(
                  isLoading: viewModel.isLoading,
                  entity: task,
                  onSelected: viewModel.onActionSelected,
                )
              ],
      ),
      body: FormCard(children: [
        // STARTER: widgets - do not remove comment
        Text(task.Lead_Task_Type, style: Theme.of(context).textTheme.title),
        SizedBox(height: 12.0),

        Text(task.Lead_Task_Title),
        Text(task.Lead_Task_Description),
        Text(task.Lead_Task_Time),
        Text(task.Alert_Time_Offset),
        Text(task.Lead_Task_Status),
        Text(task.Lead_ID),
        Text(task.Contact_ID),
        Text(task.Core_Lead_ID),
      ]),
    );
  }
}
