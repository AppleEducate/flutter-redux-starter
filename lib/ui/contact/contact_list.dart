import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'contact_item.dart';
import 'contact_list_vm.dart';

import "package:pull_to_refresh/pull_to_refresh.dart";

class ContactList extends StatelessWidget {
  final ContactListVM viewModel;
  final RefreshController _refreshController = RefreshController();

  ContactList({
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
    if (viewModel.contactList == null || viewModel.contactList.isEmpty) {
      return Text('No Contacts Found');
    }

    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: (bool up) =>
          viewModel.onRefreshed(context, up, _refreshController),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: viewModel.contactList.length,
          itemBuilder: (BuildContext context, index) {
            var contactId = viewModel.contactList[index];
            var contact = viewModel.contactMap[contactId];
            return Column(children: <Widget>[
              ContactItem(
                contact: contact,
                onDismissed: (DismissDirection direction) =>
                    viewModel.onDismissed(context, contact, direction),
                onTap: () => viewModel.onContactTap(context, contact),
                onEdit: () => viewModel.onEdit(context, contact),
                onDelete: () => viewModel.onDelete(context, contact),
                onShare: () => viewModel.onShare(context, contact),
              ),
              Divider(height: 1.0),
            ]);
          }),
    );
  }
}
