import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/app_routes.dart';

import 'binding_services/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Change the MaterialApp to GetMaterialApp to get access to GetX properties across the app
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX',
      initialBinding: StoreBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: appPages,
    );
  }
}


