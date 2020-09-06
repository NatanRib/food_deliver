import 'package:get/get.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/item_repository.dart';

class ItemController extends GetxController {

final ItemRepository repository;
ItemController({@required this.repository}) : assert(repository != null);

  var items = List<Item>();

  var selectedItems = List<Item>();

  onInit(){
    getAll();
    getByCategory('Burguer');
    update();
  }

  getAll(){
    items = repository.getAll();
    update();
  }

  getByCategory(String cat){
    print('entrou');
    List<Item> its = [];

    for (var item in this.items){
      if (item.category == cat) {
        its.add(item);
      }
    }
    selectedItems = its;
    update();
  }
}