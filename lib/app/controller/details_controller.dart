import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {

//final MyRepository repository;
DetailsController(this.i);

  Item i;

  final _item = Object().obs;
  set item(value) => this._item.value = value;
  get item => this._item.value;

  onInit(){
    getItem(i);
  }

  getItem(Item item){
    this.item = item;
  }

  changeItem(Item i){
    print('trocando items');
    item = i;
  }
}