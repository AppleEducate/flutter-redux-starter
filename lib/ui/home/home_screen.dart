import 'package:flutter/material.dart';
import '../../utils/date_formatter.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              "Welcome!",
              style: Theme.of(context).textTheme.display1,
              textAlign: TextAlign.center,
            ),
            Text(
              formatDateCustom(DateTime.now()),
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
