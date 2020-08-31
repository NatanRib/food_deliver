import 'package:food_delivery/app/data/model/category.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/category_repository.dart';

class CategoryController extends GetxController {

final CategoryRepository repository;
CategoryController({@required this.repository}) : assert(repository != null);

  final _cats = List<Category>().obs;
  set categories(value) => this._cats.value = value;
  get categories => this._cats.value;

  final _selectedCat = 'Burguer'.obs;
  set selectedcategory(value) => this._selectedCat.value = value;
  get selectedcategory => this._selectedCat.value;

  onInit(){
    getAll();
  }

  changeCategory(String cat){
    selectedcategory = cat;
  }

  getAll(){
    categories = repository.getAll();
  }
}