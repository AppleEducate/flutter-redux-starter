import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/ui/app/app_search.dart';
import 'package:MyUnifyMobile/ui/app/app_search_button.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/data/models/group_model.dart';
import 'package:MyUnifyMobile/ui/group/group_list_vm.dart';
import 'package:MyUnifyMobile/redux/group/group_actions.dart';
import 'package:MyUnifyMobile/ui/app/app_drawer_vm.dart';
import 'package:MyUnifyMobile/ui/app/app_bottom_bar.dart';

class GroupScreen extends StatelessWidget {
  static final String route = '/group';

  @override
  Widget build(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppSearch(
          entityType: EntityType.group,
          onSearchChanged: (value) {
            store.dispatch(SearchGroups(value));
          },
        ),
        actions: [
          AppSearchButton(
            entityType: EntityType.group,
            onSearchPressed: (value) {
              store.dispatch(SearchGroups(value));
            },
          ),
        ],
      ),
      drawer: AppDrawerBuilder(),
      body: GroupListBuilder(),
      bottomNavigationBar: AppBottomBar(
        entityType: EntityType.group,
        onSelectedSortField: (value) {
          store.dispatch(SortGroups(value));
        },
        sortFields: [
          // STARTER: sort - do not remove comment
          GroupFields.name,
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {
          store.dispatch(EditGroup(group: GroupEntity(), context: context));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'New Group',
      ),
    );
  }
}
