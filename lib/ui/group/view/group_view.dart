import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/app/actions_menu_button.dart';
import 'package:MyUnifyMobile/ui/group/view/group_view_vm.dart';
import 'package:MyUnifyMobile/ui/app/form_card.dart';

class GroupView extends StatefulWidget {
  final GroupViewVM viewModel;

  GroupView({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _GroupViewState createState() => new _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  @override
  Widget build(BuildContext context) {
    var viewModel = widget.viewModel;
    var group = viewModel.group;

    return Scaffold(
      appBar: AppBar(
        title: Text(group.displayName),
        actions: group.isNew
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
                  entity: group,
                  onSelected: viewModel.onActionSelected,
                )
              ],
      ),
      body: FormCard(children: [
        // STARTER: widgets - do not remove comment
        Text(group.name, style: Theme.of(context).textTheme.title),
        SizedBox(height: 12.0),
      ]),
    );
  }
}
