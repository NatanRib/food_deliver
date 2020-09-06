import 'package:food_delivery/app/data/model/cart.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';

class CartController extends GetxController {

  final CartRepository repository;
  CartController({@required this.repository}) : assert(repository != null);

  var cart = Cart();
  
  final _cartEnd = false.obs;
  get cartEnd => _cartEnd.value; 
  set cartEnd(value) => _cartEnd.value = value;
  final _cartStart = false.obs;
  get cartStart => _cartStart.value; 
  set cartStart(value) => _cartStart.value = value;
  final _cartFinal = false.obs;
  get cartFinal => _cartFinal.value; 
  set cartFinal(value) => _cartFinal.value = value;

  onInit(){
    getCart();
  }

  getCart(){
    cart = repository.getAll();
    print(cart.items.length);
    update();
  }

  addOne(Item i){
    if (cart.items.indexOf(i)== -1){
      Item item = Item(
        name: i.name, description: i.description, price: i.price,
         category: i.category, urlImage: i.urlImage, qtd: i.qtd);
      cart.items.add(item);
      update();
    } 
  }

  removeOne(i){
    if(cart.items.indexOf(i) != -1){
      cart.items.remove(i);
      update();
    }
  }

  totalOrder(){
    double total = 10.0;

    for (var item in cart.items){
      total += item.price;
    }

    return total; 
  }

  closeCart(){
    cartEnd = false;
    cartStart = !cartStart;
    cartFinal = true;
    print('back cart');
  }

}
