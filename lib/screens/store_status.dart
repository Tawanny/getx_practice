import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/a_controllers.dart';

class StoreStatus extends StatelessWidget {
  static const routeName = '/store_status';
  StoreStatus({Key? key}) : super(key: key);

  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Status Toggle")),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Is the Store open?",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 16),
              Obx(
                    () => Switch(
                  onChanged: (value) => storeController.storeStatus(value),
                  activeColor: Colors.green,
                  value: storeController.storeStatus.value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}