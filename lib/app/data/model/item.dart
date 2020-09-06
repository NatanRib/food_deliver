import 'package:food_delivery/app/data/model/category.dart';

class Item{
  String name;
  String description;
  double price;
  String category;
  String urlImage;
  int qtd;
  //img

  Item({this.name, this.description, this.price, this.category, this.urlImage, this.qtd = 1});
  Item.none();


}