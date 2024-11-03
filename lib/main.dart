import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obateka/app/config/ColorConfig.dart';
import 'package:obateka/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Obateka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorConfig.primaryColor,
        ),
      ),
      getPages: AppPages.pages,
      initialRoute: AppPages.INITIAL,
    );
  }
}
