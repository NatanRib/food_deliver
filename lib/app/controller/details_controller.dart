import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {

//final MyRepository repository;
DetailsController(this.i);

  Item i;

  var item = Item();

  onInit(){
    getItem(i);
    update();
  }

  getItem(Item item){
    this.item = item;
    update();
  }

  increaseQtd(){
    if(item.qtd < 10){
      item.qtd ++;
      update();
    }
  }

  decreaseQtd(){
    if (item.qtd > 1){
      item.qtd --;
      update();
    }
  }

  resetQtd(){
    i.qtd = 1;
    update();
  }

  changeItem(Item i){
    print('trocando items');
    item = i;
    update();
  }
}