import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/ui/app/app_search.dart';
import 'package:MyUnifyMobile/ui/app/app_search_button.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/data/models/contact_model.dart';
import 'package:MyUnifyMobile/ui/contact/contact_list_vm.dart';
import 'package:MyUnifyMobile/redux/contact/contact_actions.dart';
import 'package:MyUnifyMobile/ui/app/app_drawer_vm.dart';
import 'package:MyUnifyMobile/ui/app/app_bottom_bar.dart';

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
            store.dispatch(SearchContacts(value));
          },
        ),
        actions: [
          AppSearchButton(
            entityType: EntityType.contact,
            onSearchPressed: (value) {
              store.dispatch(SearchContacts(value));
            },
          ),
        ],
      ),
      drawer: AppDrawerBuilder(),
      body: ContactListBuilder(),
      bottomNavigationBar: AppBottomBar(
        entityType: EntityType.contact,
        onSelectedSortField: (value) {
          store.dispatch(SortContacts(value));
        },
        sortFields: [
          // STARTER: sort - do not remove comment
          ContactFields.first_name,

          ContactFields.last_name,

          ContactFields.email,
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
