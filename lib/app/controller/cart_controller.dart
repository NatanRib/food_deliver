import 'package:food_delivery/app/data/model/cart.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';

class CartController extends GetxController {

  final CartRepository repository;
  CartController({@required this.repository}) : assert(repository != null);

  var cart = Cart();
  var total = 0.0;
  
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
    total = cart.frete;
    update();
  }

  addOne(Item i){

     List<String> nameOfItens = [];

    for (var it in cart.items){
      nameOfItens.add(it.name);
    }

    if(nameOfItens.indexOf(i.name) == -1){ 
      Item item = Item(
        name: i.name, description: i.description, price: i.price,
         category: i.category, urlImage: i.urlImage, qtd: i.qtd);
      print('item: ${i.name} | qtd: ${i.qtd} | price: ${i.price} | total: ${i.price * i.qtd}');
      total+= item.price * item.qtd;
      cart.items.add(item);
      update();
    } 
  }

  removeOne(Item i){
    if(cart.items.indexOf(i) != -1){
      print('item: ${i.name} | qtd: ${i.qtd} | price :${i.price} | total: ${i.price * i.qtd}');
      total -= i.price * i.qtd;
      cart.items.remove(i);
      update();
    }
    //totalOrder();
  }

  clearCart(){
    this.cart = Cart();
    this.total = this.cart.frete;
    update();
  }

  // totalOrder(){

  //   for (var item in cart.items){
  //     total += item.price;
  //   }
  //   total += 10.0;
  //   update(); 
  // }

  closeCart(){
    cartEnd = false;
    cartStart = !cartStart;
    cartFinal = true;
  }

}
