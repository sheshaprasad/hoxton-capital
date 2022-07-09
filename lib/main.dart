import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/server_controller.dart';
import './views/splash_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controllers/splash_controller.dart';

void main() {

  Get.put(SplashController());
  Get.put(ServerController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hoxton Capital Assignment',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveSizer(
          builder: (context, orientation, screenType) {
          return SplashView();
        }
      ),
    );
  }
}