 import 'package:get/get.dart';

import 'screens/a_screens.dart';

///You can add binding or bindings for any page in getPage
 List<GetPage> appPages =[
  GetPage(name: '/', page: () => const Home()),
  GetPage(name: AddFollowerCount.routeName, page: () =>AddFollowerCount()),
  GetPage(name: StoreStatus.routeName, page: () => StoreStatus()),
  GetPage(name: UpdateStoreName.routeName, page: () => UpdateStoreName()),

];