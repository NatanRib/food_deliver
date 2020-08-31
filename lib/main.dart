import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_delivery/app/ui/android/home/home_page.dart';
import 'package:food_delivery/app/routes/app_pages.dart';
import 'package:food_delivery/app/ui/theme/app_theme.dart';
// import 'package:food_delivery/app/binding/home_binding.dart';

void main() {
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //initialBinding: HomeBinding(),
        initialRoute: '/',
        theme: appThemeData,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        home: HomePage(),
    )
  );
}