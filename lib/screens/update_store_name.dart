import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/a_controllers.dart';
import '../widgets/a_widgets.dart';

class UpdateStoreName extends StatelessWidget {
  static const routeName = '/update_store_name';
  UpdateStoreName({super.key});

  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Store Name'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter Store Name",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16),
            RoundedInput(
              hintText: "Store Name",
              controller: storeController.storeNameEditingController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              /// this is how we access the fns in the controller
              onPressed: () {
                storeController.updateStoreName(
                  storeController.storeNameEditingController.text,
                );
                Get.snackbar(
                  'Updated',
                  'Store name has been updated to\n '
                      '${storeController.storeNameEditingController.text}',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Update',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
