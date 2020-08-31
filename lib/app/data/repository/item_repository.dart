//import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/model/item.dart';

class ItemRepository {

//final MyApiClient apiClient;

// ItemRepository({@required this.apiClient}) : assert(apiClient != null);
//
  List<Item> _items = [
    Item('X-Burger', 11.50, 'Burguer'),
    Item('X-Tudo', 18.50, 'Burguer'),
    Item('X-Salada', 11.20, 'Burguer'),
    Item('X-Bacon', 14.80, 'Burguer'),
    Item('X-Hot Dog', 15.80, 'Burguer'),
    Item('Carne', 3.50, 'Pastel'),
    Item('Frango', 3.50, 'Pastel'),
    Item('Carne e Frango', 5.50, 'Pastel'),
    Item('Frango e Catupiry', 5.50, 'Pastel'),
    Item('Pizza', 5.50, 'Pastel'),
    Item('Chocolate', 5.50, 'Pastel'),
    Item('4 Queijos', 23.60,'Pizza'),
    Item('Calabresa', 21.80,'Pizza'),
    Item('Da Casa', 29.90,'Pizza'),
    Item('Do Chefe', 32.80,'Pizza'),
    Item('Sub Zero', 3.40,'Beer'),
    Item('Polo Norte', 2.40,'Beer'),
    Item('Pagode', 2.20,'Beer'),
    Item('Conta Comigo', 2.60,'Beer'),
    Item('Coque', 4.20, 'Soda'),
    Item('Guarana', 3.20, 'Soda'),
    Item('Lemon', 3.20, 'Soda'),
    Item('Uva hhhm', 3.20, 'Soda'),
    Item('Chocolate - 1L', 14.50,'Ice Cream'),
    Item('Creme - 1L', 14.50,'Ice Cream'),
    Item('Morango - 1L', 14.50,'Ice Cream'),
    Item('Limão - 1l', 1.00,'Ice Cream'),
  ];

  getAll(){
    return _items;
  }
  // getId(id){
  //   return apiClient.getId(id);
  // }
  // delete(id){
  //   return apiClient.delete(id);
  // }
  // edit(obj){
  //   return apiClient.edit( obj );
  // }
  // add(obj){
  //     return apiClient.add( obj );
  // }

}