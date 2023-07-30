import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/a_controllers.dart';

class AddFollowerCount extends StatelessWidget {
  static const routeName = '/add_followers_count';
  AddFollowerCount({Key? key}) : super(key: key);
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Follower Count")),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have add these many followers to your store',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 40.0,
              ),

              /// The difference between these 2 is that:
              /// for the observable variable you have to call .value not on the other
              Obx(
                () => Text(
                  storeController.followerCount.value.toString(),
                  style: const TextStyle(fontSize: 48),
                ),
              ),

              GetBuilder<StoreController>(
                builder: (newController) => Text(
                  'With GetBuilder: ${newController.storeFollowerCount.toString()}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          storeController.updateFollowerCount();
          storeController.incrementStoreFollowers();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
