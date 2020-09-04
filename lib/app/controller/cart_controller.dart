import 'package:food_delivery/app/data/model/cart.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';

class CartController extends GetxController {

  final CartRepository repository;
  CartController({@required this.repository}) : assert(repository != null);

  final _cart = Cart().obs;
  set cart(value) => this._cart.value = value;
  get cart => this._cart.value;

  
  final _cartEnd = false.obs;
  final _cartStart = false.obs;
  final _cartFinal = false.obs;
  set cartEnd(value) => this._cartEnd.value = value;
  get cartEnd => this._cartEnd.value;
  set cartStart(value) => this._cartStart.value = value;
  get cartStart => this._cartStart.value;
  set cartFinal(value) => this._cartFinal.value = value;
  get cartFinal => this._cartFinal.value;

  onInit(){
    getCart();
  }

  getCart(){
    cart = repository.getAll();
    print(cart.items.length);
  }

  addOne(i){
    int index = cart.items.indexOf(i);
    repository.addOne(index);
    getCart();  
  }

  removeOne(i){
    int index = cart.items.indexOf(i);
    repository.removeOne(index);
    getCart();  
  }

  totalOrder(){
    double total = 10.0;

    for (var item in cart.items){
      total += item.price;
    }

    return total; 
  }

  add(Item i){
    cart = repository.add(i);
    getCart();
  }
  
}
