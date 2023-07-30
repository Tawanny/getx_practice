import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../controllers/a_controllers.dart';
import '../widgets/a_widgets.dart';

/// You can access the controller by extending GetView and injecting the controller;
///
/// To access the values of the variables from th controller,
/// we have to wrap the affected widget with Obx. By that we will ensure that
/// only the affected widget is going to rebuild. In a StatefulWidget
/// we would have been using setState to se the changes.
/// NB: Wrapping the widget with Obx or GetX builder is known as reactive state management

class Home extends GetView<StoreController> {
  static const routeName = '/';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceCadet,
      appBar: AppBar(
        title: const Text("GetX Store"),
      ),
      drawer: const SideDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainCard(
                title: "Store Info",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Store Name:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),

                        ///Obx
                        Obx(
                              () => Flexible(
                            fit: FlexFit.tight,
                            child: Text(controller.storeName.value.toString(),
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Store Followers:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Obx(
                              () => Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              controller.followerCount.value.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        ///The GetBuilder is getting its value from the variable
                        ///that is not observed
                        GetBuilder<StoreController>(
                          builder: (newController) => Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              newController.storeFollowerCount.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Status:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),

                        /// Alternatively to Obx we can wrap the widget with a
                        /// GetX builder fn. This way we don't need to instantiate the controller before hand.
                        GetX<StoreController>(
                          builder: (sController) => Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              sController.storeStatus.value ? 'Open' : 'Closed',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: controller.storeStatus.value
                                      ? Colors.green.shade700
                                      : Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}