import 'package:get/get.dart';
import 'package:food_delivery/app/ui/android/home/home_page.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> HomePage(),)
  ];
}