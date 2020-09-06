import 'package:food_delivery/app/data/model/category.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/category_repository.dart';

class CategoryController extends GetxController {

final CategoryRepository repository;
CategoryController({@required this.repository}) : assert(repository != null);

  var categories = List<Category>();

  var selectedCategory = 'Burguer';

  onInit(){
    getAll();
    update();
  }

  changeCategory(String cat){
    selectedCategory = cat;
    update();
  }

  getAll(){
    categories = repository.getAll();
    update();
  }
}