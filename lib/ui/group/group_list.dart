import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/group/group_item.dart';
import 'package:MyUnifyMobile/ui/group/group_list_vm.dart';

class GroupList extends StatelessWidget {
  final GroupListVM viewModel;

  GroupList({
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
          itemCount: viewModel.groupList.length,
          itemBuilder: (BuildContext context, index) {
            var groupId = viewModel.groupList[index];
            var group = viewModel.groupMap[groupId];
            return Column(children: <Widget>[
              GroupItem(
                group: group,
                onDismissed: (DismissDirection direction) =>
                    viewModel.onDismissed(context, group, direction),
                onTap: () => viewModel.onGroupTap(context, group),
              ),
              Divider(height: 1.0),
            ]);
          }),
    );
  }
}
