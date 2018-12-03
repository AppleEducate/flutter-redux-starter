import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:redux/redux.dart';

class AppBottomBar extends StatefulWidget {
  final List<String> sortFields;
  final Function(String) onSelectedSortField;
  final EntityType entityType;

  AppBottomBar({this.sortFields, this.onSelectedSortField, this.entityType});

  @override
  _AppBottomBarState createState() => new _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  PersistentBottomSheetController _sortController,
      _filterController,
      _groupsController;

  bool _sortTap, _filterTap, _groupTap;

  @override
  void initState() {
    _sortTap = false;
    _filterTap = false;
    _groupTap = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _showSortSheet = () {
      if (_sortController != null) {
        _sortController.close();
        setState(() {
          _sortTap = false;
        });
        return;
      }

      setState(() {
        _sortTap = true;
      });

      _sortController = Scaffold.of(context).showBottomSheet((context) {
        return StoreConnector<AppState, ListUIState>(
          converter: (Store<AppState> store) =>
              store.state.getListState(widget.entityType),
          builder: (BuildContext context, listUIState) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.sortFields.map((sortField) {
                    return RadioListTile(
                      dense: true,
                      // TODO replace with localization
                      title: Text(
                          sortField[0].toUpperCase() + sortField.substring(1)),
                      subtitle: sortField == listUIState.sortField
                          ? Text(listUIState.sortAscending
                              ? 'Ascending'
                              : 'Descending')
                          : null,
                      groupValue: listUIState.sortField,
                      onChanged: (value) {
                        widget.onSelectedSortField(value);
                      },
                      value: sortField,
                    );
                  }).toList()),
            );
          },
        );
      });

      _sortController.closed.whenComplete(() {
        _sortController = null;
        setState(() {
          _sortTap = false;
        });
      });
    };

    final _showFilterSheet = () {
      if (_filterController != null) {
        _filterController.close();
        setState(() {
          _filterTap = false;
        });
        return;
      }

      setState(() {
        _filterTap = true;
      });

      _filterController = Scaffold.of(context).showBottomSheet((context) {
        return StoreConnector<AppState, ListUIState>(
          converter: (Store<AppState> store) =>
              store.state.getListState(widget.entityType),
          builder: (BuildContext context, listUIState) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.sortFields.map((sortField) {
                    return RadioListTile(
                      dense: true,
                      // TODO replace with localization
                      title: Text(
                          sortField[0].toUpperCase() + sortField.substring(1)),
                      subtitle: sortField == listUIState.sortField
                          ? Text(listUIState.sortAscending
                              ? 'Ascending'
                              : 'Descending')
                          : null,
                      groupValue: listUIState.sortField,
                      onChanged: (value) {
                        widget.onSelectedSortField(value);
                      },
                      value: sortField,
                    );
                  }).toList()),
            );
          },
        );
      });

      _filterController.closed.whenComplete(() {
        _filterController = null;
        setState(() {
          _filterTap = false;
        });
      });
    };

    final _showGroupSheet = () {
      if (_groupsController != null) {
        _groupsController.close();
        setState(() {
          _groupTap = false;
        });
        return;
      }

      setState(() {
        _groupTap = true;
      });

      _groupsController = Scaffold.of(context).showBottomSheet((context) {
        return StoreConnector<AppState, ListUIState>(
          converter: (Store<AppState> store) =>
              store.state.getListState(widget.entityType),
          builder: (BuildContext context, listUIState) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.sortFields.map((sortField) {
                    return RadioListTile(
                      dense: true,
                      // TODO replace with localization
                      title: Text(
                          sortField[0].toUpperCase() + sortField.substring(1)),
                      subtitle: sortField == listUIState.sortField
                          ? Text(listUIState.sortAscending
                              ? 'Ascending'
                              : 'Descending')
                          : null,
                      groupValue: listUIState.sortField,
                      onChanged: (value) {
                        widget.onSelectedSortField(value);
                      },
                      value: sortField,
                    );
                  }).toList()),
            );
          },
        );
      });

      _groupsController.closed.whenComplete(() {
        _groupsController = null;
        setState(() {
          _groupTap = false;
        });
      });
    };

    return new BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Sort',
            icon: Icon(Icons.sort_by_alpha),
            onPressed:
                _filterTap == true || _groupTap == true ? null : _showSortSheet,
          ),
          IconButton(
            tooltip: 'Filter',
            icon: Icon(Icons.filter_list),
            onPressed:
                _sortTap == true || _groupTap == true ? null : _showFilterSheet,
          ),
          IconButton(
            tooltip: 'Groups',
            icon: Icon(Icons.group),
            onPressed:
                _filterTap == true || _sortTap == true ? null : _showGroupSheet,
          ),
        ],
      ),
    );
  }
}
