
///Instantiating the controller can be done in 3 ways
///1. by extending GetView and injecting the controller
///eg: class Home extends GetView<StoreController>{}
///
/// 2. instantiating the controller like this:
/// final storeController = Get.put(StoreController);
/// or this:
/// final storeController = Get.find<StoreController>();
///
/// 3. Is by using StoreBinding and Get.lazyPut

export 'home.dart';
export 'update_store_name.dart';
export 'add_follower_count.dart';
export 'store_status.dart';