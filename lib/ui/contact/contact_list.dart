import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/contact/contact_item.dart';
import 'package:MyUnifyMobile/ui/contact/contact_list_vm.dart';

class ContactList extends StatelessWidget {
  final ContactListVM viewModel;

  ContactList({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (! viewModel.isLoaded) {
      return Center(child: CircularProgressIndicator());
    }

    return _buildListView(context);
  }

  Widget _buildListView(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => viewModel.onRefreshed(context),
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
              ),
              Divider(
                height: 1.0,
              ),
            ]);
          }),
    );
  }
}
