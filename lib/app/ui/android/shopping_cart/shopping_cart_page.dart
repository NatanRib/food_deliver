import 'package:flutter/material.dart';
import 'package:food_delivery/app/controller/cart_controller.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';
import 'package:food_delivery/app/ui/android/shopping_cart/widgets/shopping_cart_widgets.dart';
import 'package:get/get.dart';

class ShoppingCartPage extends StatelessWidget {
  
  final cartController = Get.put(CartController(repository: CartRepository())); 
  final shoppingCartWidgets = Get.put(ShoppingCartWidgets());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orangeAccent[200],
            borderRadius: BorderRadius.circular(20)
          ),
          padding: const EdgeInsets.only(left: 10.0, top: 3.0, right: 10.0, bottom: 3.0),
          height: Get.height * 0.90,
          width: Get.width * 0.98,
          child: Column(
            children: [
              cartController.cart.items == null ?
                Container() :
                  Expanded(
                    flex: 7,
                    child: Container(
                      // height: Get.height *0.7,
                      // width: Get.width,
                      child: ListView.builder(
                        itemCount: cartController.cart.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  shoppingCartWidgets.cardItem(cartController.cart.items[index]);
                        },
                      ),
                    ),
                  ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top : 10.0, bottom: 10),
                  child: shoppingCartWidgets.deliveryService(10.00),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: shoppingCartWidgets.checkOut(cartController.totalOrder()),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}