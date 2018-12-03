import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../data/models/contact_model.dart';
import '../../data/models/models.dart';
import '../../redux/app/app_state.dart';
import '../../redux/contact/contact_actions.dart';
import '../app/app_bottom_bar.dart';
import '../app/app_drawer_vm.dart';
import '../app/app_search.dart';
import '../app/app_search_button.dart';
import 'contact_list_vm.dart';
import '../../data/models/search_model.dart';
import '../../data/models/paging_model.dart';

class ContactScreen extends StatelessWidget {
  static final String route = '/contact';

  @override
  Widget build(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppSearch(
          entityType: EntityType.contact,
          onSearchChanged: (value) {
            store.dispatch(SearchContacts(value, [0]));
          },
        ),
        actions: [
          AppSearchButton(
            entityType: EntityType.contact,
            onSearchPressed: (value) {
              store.dispatch(SearchContacts(value, [0]));
            },
          ),
        ],
      ),
      drawer: AppDrawerBuilder(),
      body: ContactListBuilder(),
      bottomNavigationBar: AppBottomBar(
        showGroups: true,
        entityType: EntityType.contact,
        onSelectedSortField: (value) {
          store.dispatch(SortContacts(value));
        },
        onSelectedContactGroup: (value) {
          print("Group ==> $value");
          if (value != null) {
            store.dispatch(GroupContacts(value));
            print(
              "New Group Field ==> ${store.state.contactListState.groupField}",
            );
            store.dispatch(ChangeSearchModel(
              search: SearchModel(
                search: value == "all" ? "" : value,
                filters: [value == "all" ? 0 : 5],
              ),
            ));
            store
              ..dispatch(ChangePaging(
                paging: PagingModel(page: 1, rows: 100),
              ));
          }
        },
        sortFields: [
          // STARTER: sort - do not remove comment
          ContactFields.first_name,

          ContactFields.last_name,

          // ContactFields.cell_phone,

          // ContactFields.office_phone,

          // ContactFields.home_phone,

          ContactFields.date_created,

          ContactFields.date_modified,

          // ContactFields.email,

          ContactFields.last_activity,
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {
          store.dispatch(
              EditContact(contact: ContactEntity(), context: context));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: 'New Contact',
      ),
    );
  }
}
