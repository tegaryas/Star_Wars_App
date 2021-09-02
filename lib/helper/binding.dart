import 'package:get/get.dart';
import 'package:starwars_app/helper/local_storage.dart';
import 'package:starwars_app/viewmodels/auth_view_model.dart';
import 'package:starwars_app/viewmodels/control_view_model.dart';
import 'package:starwars_app/viewmodels/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}
