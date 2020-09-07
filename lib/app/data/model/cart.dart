import 'package:food_delivery/app/data/model/item.dart';

class Cart{
  List<Item> items = [];
  double frete;

  Cart({this.frete = 10.0});
}