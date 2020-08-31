//import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/model/category.dart';

class CategoryRepository {

//final MyApiClient apiClient;

//CategoryRepository({@required this.apiClient}) : assert(apiClient != null);
List<Category> _categories = [
  Category('Burguer'),
  Category('Pastel'),
  Category('Pizza'),
  Category('Beer'),
  Category('Soda'),
  Category('Ice Cream'),
];

getAll(){
  return _categories;
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