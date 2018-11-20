import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MyUnifyMobile/ui/app/form_card.dart';
import 'package:MyUnifyMobile/ui/task/edit/task_edit_vm.dart';
import 'package:MyUnifyMobile/ui/app/save_icon_button.dart';

class TaskEdit extends StatefulWidget {
  final TaskEditVM viewModel;

  TaskEdit({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _TaskEditState createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEdit> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // STARTER: controllers - do not remove comment
  final _Lead_Task_TypeController = TextEditingController();

  final _Lead_Task_TitleController = TextEditingController();

  final _Lead_Task_DescriptionController = TextEditingController();

  final _Lead_Task_TimeController = TextEditingController();

  final _Alert_Time_OffsetController = TextEditingController();

  final _Lead_Task_StatusController = TextEditingController();

  final _Lead_IDController = TextEditingController();

  final _Contact_IDController = TextEditingController();

  final _Core_Lead_IDController = TextEditingController();

  var _controllers = [];

  @override
  void didChangeDependencies() {
    _controllers = [
      // STARTER: array - do not remove comment
      _Lead_Task_TypeController,

      _Lead_Task_TitleController,

      _Lead_Task_DescriptionController,

      _Lead_Task_TimeController,

      _Alert_Time_OffsetController,

      _Lead_Task_StatusController,

      _Lead_IDController,

      _Contact_IDController,

      _Core_Lead_IDController,
    ];

    _controllers.forEach((controller) => controller.removeListener(_onChanged));

    var task = widget.viewModel.task;
    // STARTER: read value - do not remove comment
    _Lead_Task_TypeController.text = task.Lead_Task_Type;

    _Lead_Task_TitleController.text = task.Lead_Task_Title;

    _Lead_Task_DescriptionController.text = task.Lead_Task_Description;

    _Lead_Task_TimeController.text = task.Lead_Task_Time;

    _Alert_Time_OffsetController.text = task.Alert_Time_Offset;

    _Lead_Task_StatusController.text = task.Lead_Task_Status;

    _Lead_IDController.text = task.Lead_ID;

    _Contact_IDController.text = task.Contact_ID;

    _Core_Lead_IDController.text = task.Core_Lead_ID;

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
    var task = widget.viewModel.task.rebuild((b) => b
      // STARTER: set value - do not remove comment
      ..Lead_Task_Type = _Lead_Task_TypeController.text.trim()
      ..Lead_Task_Title = _Lead_Task_TitleController.text.trim()
      ..Lead_Task_Description = _Lead_Task_DescriptionController.text.trim()
      ..Lead_Task_Time = _Lead_Task_TimeController.text.trim()
      ..Alert_Time_Offset = _Alert_Time_OffsetController.text.trim()
      ..Lead_Task_Status = _Lead_Task_StatusController.text.trim()
      ..Lead_ID = _Lead_IDController.text.trim()
      ..Contact_ID = _Contact_IDController.text.trim()
      ..Core_Lead_ID = _Core_Lead_IDController.text.trim());
    if (task != widget.viewModel.task) {
      widget.viewModel.onChanged(task);
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
          title: Text(
              viewModel.task.isNew ? 'New Task' : viewModel.task.displayName),
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
                    controller: _Lead_Task_TypeController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Lead_Task_Type',
                    ),
                  ),

                  TextFormField(
                    controller: _Lead_Task_TitleController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Lead_Task_Title',
                    ),
                  ),

                  TextFormField(
                    controller: _Lead_Task_DescriptionController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Lead_Task_Description',
                    ),
                  ),

                  TextFormField(
                    controller: _Lead_Task_TimeController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Lead_Task_Time',
                    ),
                  ),

                  TextFormField(
                    controller: _Alert_Time_OffsetController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Alert_Time_Offset',
                    ),
                  ),

                  TextFormField(
                    controller: _Lead_Task_StatusController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Lead_Task_Status',
                    ),
                  ),

                  TextFormField(
                    controller: _Lead_IDController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Lead_ID',
                    ),
                  ),

                  TextFormField(
                    controller: _Contact_IDController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Contact_ID',
                    ),
                  ),

                  TextFormField(
                    controller: _Core_Lead_IDController,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Core_Lead_ID',
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
