import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongodbcrud/pages/splashscreen/view/splasgscreen_view.dart';
import 'package:sizer/sizer.dart';

import 'database/mongo_database_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseController.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashscreenView(),
      );
    });
  }
}
