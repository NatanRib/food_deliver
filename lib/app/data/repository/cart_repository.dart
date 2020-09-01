//import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/model/cart.dart';

class CartRepository {

//final MyApiClient apiClient;

//ChartRepository({@required this.apiClient}) : assert(apiClient != null);

Cart _chart = Cart(0);

getAll(){
  return _chart;
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