import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/text_format.dart';
import '../../../widgets/email_tile.dart';
import '../../../widgets/phone_tile.dart';
import '../../app/actions_menu_button.dart';
import 'contact_view_vm.dart';

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
        title: contact.isNew
            ? Text("New Contact")
            : Text("Contact Details"), //contact.displayName
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
      // body: FormCard(children: [
      //   // STARTER: widgets - do not remove comment
      //   Text(contact.first_name, style: Theme.of(context).textTheme.title),
      //   SizedBox(height: 12.0),

      //   Text(contact.last_name),
      //   Text(contact.cell_phone),
      //   Text(contact.office_phone),
      //   Text(contact.home_phone),
      //   Text(contact.date_created),
      //   Text(contact.date_modified),
      //   Text(contact.email),
      //   Text(contact.last_activity),
      // ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                contact?.displayName ?? '',
                textScaleFactor: textScaleFactor,
              ),
              // subtitle: _contactDetails == null ||
              //         _contactDetails?.birthday.toString().isEmpty
              //     ? null
              //     : Text(
              //         "Birthday: ${_contactDetails?.birthday}",
              //         textScaleFactor: textScaleFactor,
              //       ),
            ),
            buildPhoneTile(
              context,
              number: contact?.cell_phone,
              icon: Icons.phone,
              label: 'Cell',
            ),
            buildPhoneTile(
              context,
              number: contact?.home_phone,
              icon: Icons.home,
              label: 'Home',
            ),
            buildPhoneTile(
              context,
              number: contact?.office_phone,
              icon: Icons.work,
              label: 'Office',
            ),
            buildEmailTile(
              context,
              email: contact?.email,
              icon: Icons.email,
              label: 'Email',
            ),
            Container(height: 5.0),
          ],
        ),
      ),
    );
  }
}
