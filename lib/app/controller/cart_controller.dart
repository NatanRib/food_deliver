import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';

class CartController extends GetxController {

  final CartRepository repository;
  CartController({@required this.repository}) : assert(repository != null);

  final _cart = Object().obs;
  set cart(value) => this._cart.value = value;
  get cart => this._cart.value;

  onInit(){
    getOne();
  }

  getOne(){
    cart = repository.getAll();
  }
  
}
