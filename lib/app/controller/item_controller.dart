import 'package:get/get.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/item_repository.dart';

class ItemController extends GetxController {

final ItemRepository repository;
ItemController({@required this.repository}) : assert(repository != null);

  final _items = List<Item>().obs;
  set items(value) => this._items.value = value;
  get items => this._items.value;

  final _selectedItems = List<Item>().obs;
  set selectedItems(value) => this._selectedItems.value = value;
  get selectedItems => this._selectedItems.value;

  onInit(){
    getAll();
    getByCategory('Burguer');
  }

  getAll(){
    items = repository.getAll();
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
  }
}