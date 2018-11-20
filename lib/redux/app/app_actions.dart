import 'package:MyUnifyMobile/redux/app/app_state.dart';

class PersistData {}

class PersistUI {}

class StartLoading {}

class StopLoading {}

class ChangeDate {
  final AppState state;
  final String date;
  ChangeDate({this.date, this.state});
}
