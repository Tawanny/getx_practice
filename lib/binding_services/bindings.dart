import 'package:get/get.dart';
import 'package:getx_practice/controllers/a_controllers.dart';

/// Bindings binds the UI to the controller.
/// Bindings will initiate and dispose controllers automatically.
/// You will need to lazyPut the controller and add initial binding
/// in the GetMaterialApp widget.

class StoreBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
  }

}