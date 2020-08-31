import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/chart_repository.dart';

class ChartController extends GetxController {

  final ChartRepository repository;
  ChartController({@required this.repository}) : assert(repository != null);

  final _chart = Object().obs;
  set chart(value) => this._chart.value = value;
  get chart => this._chart.value;

  onInit(){
    getOne();
  }

  getOne(){
    chart = repository.getAll();
  }
  
}
