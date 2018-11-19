import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:MyUnifyMobile/data/models/models.dart';
import 'package:MyUnifyMobile/redux/app/app_state.dart';
import 'package:MyUnifyMobile/redux/app/data_state.dart';
import 'package:MyUnifyMobile/redux/auth/auth_state.dart';
import 'package:MyUnifyMobile/redux/ui/ui_state.dart';
import 'package:built_collection/built_collection.dart';
import 'package:MyUnifyMobile/redux/ui/list_ui_state.dart';
// STARTER: import - do not remove comment

part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
  LoginResponse,
  // STARTER: serializers - do not remove comment
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
