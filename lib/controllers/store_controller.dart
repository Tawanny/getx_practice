import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Controller class controls the Ui whe you wrap the individual
/// widget with its observer so that it rebuilds whenever there is a change in state
/// of that particular widget;

/// We have to make the variables observable by adding obs
/// so that other parts of the app that depend on it will be notified

class StoreController extends GetxController{
  final storeName = 'The Ellcrys'.obs;
  final followerCount = 0.obs;
  final storeStatus = true.obs;
  final followerList = [].obs;
  final reviews =  [].obs;

  final storeNameEditingController = TextEditingController();
  final reviewEditingController = TextEditingController();
  final followerEditingController = TextEditingController();
  final reviewNameEditingController = TextEditingController();

  ///For simple SM  we don't have to make te variable obs
  /// but we have to call update() method in the our fns
  /// and we need to use the GetBuilder fn on our widgets
  int storeFollowerCount = 0;

  void incrementStoreFollowers(){
    storeFollowerCount++;
    update(); /// This will ensure the widgets are notified.
  }

  /// Next we create the operational Fns

updateStoreName(String name){
  storeName(name);
}

updateFollowerCount(){
  followerCount(followerCount.value + 1);
}

void storeStatusOpen(bool isOpen){
  storeStatus(isOpen);
}
}