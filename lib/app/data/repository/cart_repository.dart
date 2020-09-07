//import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/model/cart.dart';
import 'package:food_delivery/app/data/model/item.dart';

class CartRepository {

//final MyApiClient apiClient;

//ChartRepository({@required this.apiClient}) : assert(apiClient != null);

  Cart _cart = Cart(frete: 10.0);

  add(Item i){
    _cart.items.add(i);
  }

  addOne(index){
    _cart.items[index].qtd += 1;  
  }

  removeOne(index){
    _cart.items[index].qtd -= 1;  
  }

  getAll(){
    return _cart;
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