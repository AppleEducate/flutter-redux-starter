import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/app/form_card.dart';
import 'package:MyUnifyMobile/ui/group/edit/group_edit_vm.dart';
import 'package:MyUnifyMobile/ui/app/save_icon_button.dart';

class GroupEdit extends StatefulWidget {
  final GroupEditVM viewModel;

  GroupEdit({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _GroupEditState createState() => _GroupEditState();
}

class _GroupEditState extends State<GroupEdit> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // STARTER: controllers - do not remove comment
  final _nameController = TextEditingController();

  var _controllers = [];

  @override
  void didChangeDependencies() {
    _controllers = [
      // STARTER: array - do not remove comment
      _nameController,
    ];

    _controllers.forEach((controller) => controller.removeListener(_onChanged));

    var group = widget.viewModel.group;
    // STARTER: read value - do not remove comment
    _nameController.text = group.name;

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
    var group = widget.viewModel.group.rebuild((b) => b
      // STARTER: set value - do not remove comment
      ..name = _nameController.text.trim());
    if (group != widget.viewModel.group) {
      widget.viewModel.onChanged(group);
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
          title: Text(viewModel.group.isNew
              ? 'New Group'
              : viewModel.group.displayName),
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
                    controller: _nameController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Name',
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
