import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gondwana_club/screens/splash_screen.dart';

void main() async{
  await GetStorage.init();
  runApp(GetMaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Godwana Club',
      home: SplashScreen(),
    );
  }
}
