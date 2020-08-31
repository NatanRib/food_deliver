//import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/model/chart.dart';

class ChartRepository {

//final MyApiClient apiClient;

//ChartRepository({@required this.apiClient}) : assert(apiClient != null);

Chart _chart = Chart(4);

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