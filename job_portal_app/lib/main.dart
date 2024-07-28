import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:post_app/screens/get_started/loading_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    

    return const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: LoadingScreen());
  }
}
