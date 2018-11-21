import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

import '../../utils/date_formatter.dart';
import '../../widgets/date_view.dart';
import 'task_item.dart';
import 'task_list_vm.dart';

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

    // return _buildListView(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DateViewWidget(
            date: parseDate(viewModel?.date),
            dateChanged: (DateTime value) =>
                viewModel.onDateChange(context, value),
          ),
          _buildListView(context),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    if (viewModel.taskList == null || viewModel.taskList.isEmpty) {
      return Text('No Tasks Found');
    }

    return SmartRefresher(
      // onRefresh: () => viewModel.onRefreshed(context),
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: (bool up) => viewModel.onRefreshed(context, up),
      // onOffsetChange: _onOffsetCallback,
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
              Divider(height: 1.0),
            ]);
          }),
    );
  }
}
