import 'package:flutter/material.dart';

import '../../widgets/date_view.dart';
import '../app/app_drawer_vm.dart';

class HomeScreen extends StatelessWidget {
  static final String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: AppDrawerBuilder(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DateViewWidget(),
          ],
        ),
      ),
    );
  }
}
