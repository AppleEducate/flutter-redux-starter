import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../redux/app/app_state.dart';
import '../../redux/ui/list_ui_state.dart';
import '../../data/models/models.dart';
import 'package:redux/redux.dart';

import 'package:flutter/widgets.dart';
import 'package:MyUnifyMobile/redux/group/group_selectors.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';

class AppBottomBar extends StatefulWidget {
  final List<String> sortFields;
  final Function(String) onSelectedSortField;
  final EntityType entityType;
  final bool showFilters, showGroups;

  AppBottomBar({
    this.sortFields,
    this.onSelectedSortField,
    this.entityType,
    this.showFilters = false,
    this.showGroups = false,
  });

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

      var _filters = ["Active", "Deleted"];

      _filterController = Scaffold.of(context).showBottomSheet((context) {
        return StoreConnector<AppState, ListUIState>(
          converter: (Store<AppState> store) =>
              store.state.getListState(widget.entityType),
          builder: (BuildContext context, listUIState) {
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _filters.map((sortField) {
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

      var _groups = ["All"];

      var store = StoreProvider.of<AppState>(context);

      var _groupList = memoizedGroupList(
        store.state.groupState.map,
        store.state.groupState.list,
        store.state.groupListState,
      );

      for (var _group in _groupList) {
        var groupId = _group;
        var group = store.state.groupState.map[groupId];
        _groups.add(group.name);
      }

      _groupsController = Scaffold.of(context).showBottomSheet((context) {
        return StoreConnector<AppState, ListUIState>(
          converter: (Store<AppState> store) =>
              store.state.getListState(widget.entityType),
          builder: (BuildContext context, listUIState) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _groups.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var _group = _groups[index];
                  return RadioListTile(
                    dense: true,
                    // TODO replace with localization
                    title: Text(_group),
                    groupValue: listUIState.sortField,
                    onChanged: (value) {
                      widget.onSelectedSortField(value);
                    },
                    value: _group,
                  );
                },
              ),
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
          widget.showFilters == false
              ? Container(height: 0.0, width: 0.0)
              : IconButton(
                  tooltip: 'Filter',
                  icon: Icon(Icons.filter_list),
                  onPressed: _sortTap == true || _groupTap == true
                      ? null
                      : _showFilterSheet,
                ),
          widget.showGroups == false
              ? Container(height: 0.0, width: 0.0)
              : IconButton(
                  tooltip: 'Contact Groups',
                  icon: Icon(Icons.group),
                  onPressed: _filterTap == true || _sortTap == true
                      ? null
                      : _showGroupSheet,
                ),
        ],
      ),
    );
  }
}
