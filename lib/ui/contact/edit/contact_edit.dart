import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/app/form_card.dart';
import 'package:MyUnifyMobile/ui/contact/edit/contact_edit_vm.dart';
import 'package:MyUnifyMobile/ui/app/save_icon_button.dart';

class ContactEdit extends StatefulWidget {
  final ContactEditVM viewModel;

  ContactEdit({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _ContactEditState createState() => _ContactEditState();
}

class _ContactEditState extends State<ContactEdit> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // STARTER: controllers - do not remove comment
  final _first_nameController = TextEditingController();

  final _last_nameController = TextEditingController();

  final _emailController = TextEditingController();

  var _controllers = [];

  @override
  void didChangeDependencies() {
    _controllers = [
      // STARTER: array - do not remove comment
      _first_nameController,

      _last_nameController,

      _emailController,
    ];

    _controllers.forEach((controller) => controller.removeListener(_onChanged));

    var contact = widget.viewModel.contact;
    // STARTER: read value - do not remove comment
    _first_nameController.text = contact.first_name;

    _last_nameController.text = contact.last_name;

    _emailController.text = contact.email;

    _controllers.forEach((controller) => controller.addListener(_onChanged));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });

    super.dispose();
  }

  _onChanged() {
    var contact = widget.viewModel.contact.rebuild((b) => b
      // STARTER: set value - do not remove comment
      ..first_name = _first_nameController.text.trim()
      ..last_name = _last_nameController.text.trim()
      ..email = _emailController.text.trim());
    if (contact != widget.viewModel.contact) {
      widget.viewModel.onChanged(contact);
    }
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = widget.viewModel;

    return WillPopScope(
      onWillPop: () async {
        viewModel.onBackPressed();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.contact.isNew
              ? 'New Contact'
              : viewModel.contact.displayName),
          actions: <Widget>[
            Builder(builder: (BuildContext context) {
              return SaveIconButton(
                isLoading: viewModel.isLoading,
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  viewModel.onSavePressed(context);
                },
              );
            }),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              FormCard(
                children: <Widget>[
                  // STARTER: widgets - do not remove comment
                  TextFormField(
                    controller: _first_nameController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'First_name',
                    ),
                  ),

                  TextFormField(
                    controller: _last_nameController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Last_name',
                    ),
                  ),

                  TextFormField(
                    controller: _emailController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
