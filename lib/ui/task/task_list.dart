import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/task/task_item.dart';
import 'package:MyUnifyMobile/ui/task/task_list_vm.dart';

class TaskList extends StatelessWidget {
  final TaskListVM viewModel;

  TaskList({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!viewModel.isLoaded) {
      return Center(child: CircularProgressIndicator());
    }

    return _buildListView(context);
  }

  Widget _buildListView(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => viewModel.onRefreshed(context),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: viewModel.taskList.length,
          itemBuilder: (BuildContext context, index) {
            var taskId = viewModel.taskList[index];
            var task = viewModel.taskMap[taskId];
            return Column(children: <Widget>[
              TaskItem(
                task: task,
                onDismissed: (DismissDirection direction) =>
                    viewModel.onDismissed(context, task, direction),
                onTap: () => viewModel.onTaskTap(context, task),
              ),
              Divider(
                height: 1.0,
              ),
            ]);
          }),
    );
  }
}
