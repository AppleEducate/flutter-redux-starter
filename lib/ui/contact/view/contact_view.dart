import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/app/actions_menu_button.dart';
import 'package:MyUnifyMobile/ui/contact/view/contact_view_vm.dart';
import 'package:MyUnifyMobile/ui/app/form_card.dart';

class ContactView extends StatefulWidget {
  final ContactViewVM viewModel;

  ContactView({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _ContactViewState createState() => new _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    var viewModel = widget.viewModel;
    var contact = viewModel.contact;

    return Scaffold(
      appBar: AppBar(
        title: contact.isNew ?  Text("New Contact") : Text(contact.displayName),
        actions: contact.isNew
            ? []
            : [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    viewModel.onEditPressed(context);
                  },
                ),
                ActionMenuButton(
                  isLoading: viewModel.isLoading,
                  entity: contact,
                  onSelected: viewModel.onActionSelected,
                )
              ],
      ),
      body: FormCard(children: [
        // STARTER: widgets - do not remove comment
        Text(contact.first_name, style: Theme.of(context).textTheme.title),
        SizedBox(height: 12.0),

        Text(contact.last_name),
        Text(contact.cell_phone),
        Text(contact.office_phone),
        Text(contact.home_phone),
        Text(contact.date_created),
        Text(contact.date_modified),
        Text(contact.email),
        Text(contact.last_activity),
      ]),
    );
  }
}
