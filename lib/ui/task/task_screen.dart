import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/ui/app/app_search.dart';
import 'package:MyUnifyMobile/ui/app/app_search_button.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/data/models/task_model.dart';
import 'package:MyUnifyMobile/ui/task/task_list_vm.dart';
import 'package:MyUnifyMobile/redux/task/task_actions.dart';
import 'package:MyUnifyMobile/ui/app/app_drawer_vm.dart';
import 'package:MyUnifyMobile/ui/app/app_bottom_bar.dart';

class TaskScreen extends StatelessWidget {
  static final String route = '/task';

  @override
  Widget build(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppSearch(
          entityType: EntityType.task,
          onSearchChanged: (value) {
            store.dispatch(SearchTasks(value));
          },
        ),
        actions: [
          AppSearchButton(
            entityType: EntityType.task,
            onSearchPressed: (value) {
              store.dispatch(SearchTasks(value));
            },
          ),
        ],
      ),
      drawer: AppDrawerBuilder(),
      body: TaskListBuilder(),
      bottomNavigationBar: AppBottomBar(
        entityType: EntityType.task,
        onSelectedSortField: (value) {
          store.dispatch(SortTasks(value));
        },
        sortFields: [
          // STARTER: sort - do not remove comment
          TaskFields.Lead_Task_Type,

          TaskFields.Lead_Task_Title,

          TaskFields.Lead_Task_Description,

          TaskFields.Lead_Task_Time,

          TaskFields.Alert_Time_Offset,

          TaskFields.Lead_Task_Status,

          TaskFields.Lead_ID,

          TaskFields.Contact_ID,

          TaskFields.Core_Lead_ID,
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {
          store.dispatch(EditTask(task: TaskEntity(), context: context));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'New Task',
      ),
    );
  }
}
