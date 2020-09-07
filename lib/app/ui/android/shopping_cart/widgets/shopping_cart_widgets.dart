import 'package:flutter/material.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';
import 'package:get/get.dart';
import 'package:food_delivery/app/controller/cart_controller.dart';

class ShoppingCartWidgets{

  final cartController = Get.put(CartController(repository: CartRepository()));

  Widget cartItem(Item i){
    return Container(
      width: Get.width,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            top: 3,
            child: Container(
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image(
                image: AssetImage(i.urlImage),
                height: 30,
                width: 50,
              ),
            ),
          ),
          Positioned(
            left: 65,
            top: 10,
            child: Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(i.name + ' - ${i.qtd}x',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('R\$ ' + i.price.toStringAsFixed(2))
                ],
              ),
            ),
          ),
        ],
      )       
    );
  }

  Widget deliveryService(double value){
    return Column(
      children: [
        Container(
          height: 1,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.grey[800]
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Service:',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18
              ),
            ),
            Text('R\$ '+ value.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 19
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget checkOut(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total price'),
            GetBuilder<CartController>(
              builder: (_)=> Text('R\$ '+_.total.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ))
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Container(
                width: Get.width * 0.16,
                height: Get.height,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  color: Colors.white,
                  onPressed: (){
                    cartController.closeCart();},
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: Get.height,
              child: RaisedButton(
                onPressed: (){
                  cartController.closeCart();
                  cartController.clearCart();
                  Get.snackbar(
                    'Sending order',
                    '',
                    colorText: Get.theme.primaryColor,
                    showProgressIndicator: true,
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.black,
                    
                  );
                  Future.delayed(Duration(milliseconds: 1900),
                    ()=> Get.snackbar(
                      'Order send',
                      '',
                      colorText: Get.theme.primaryColor,
                      duration: Duration(seconds: 2),
                      backgroundColor: Get.theme.accentColor
                    )
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.black,
                child: Text('Checkout',
                  style: TextStyle(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget cart(){
    return Stack(
      children: [
        //colocar a animação de enviar o pedido
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          elevation: 10,
          child:  AnimatedContainer(
            curve: Curves.bounceInOut,
            onEnd: (){
              cartController.cartFinal ? cartController.cartEnd=false : cartController.cartEnd =true;
              cartController.cartFinal = false;
            },
            duration: Duration(milliseconds: 700),
            decoration: BoxDecoration(
              color: cartController.cartStart ? Colors.orangeAccent[200] : Get.theme.accentColor,
              borderRadius: BorderRadius.circular(20)
            ),
            padding: const EdgeInsets.only(left: 10.0, top: 3.0, right: 10.0, bottom: 3.0),
            height: cartController.cartStart ? Get.height * 0.90 : 0,
            width: cartController.cartStart ? Get.width * 0.90 : 0,
            child: cartController.cartEnd ? Column(
              children: [
                cartController.cart.items == null ?
                  Container() :
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: ListView.builder(
                          itemCount: cartController.cart.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.remove_circle, color: Colors.red,),
                              ),
                              direction: DismissDirection.endToStart,
                              key: Key(cartController.cart.items[index].name),
                              onDismissed: (direction){
                                cartController.removeOne(cartController.cart.items[index]);
                                //cartController.totalOrder();
                              },
                              child: cartItem(cartController.cart.items[index]));
                          },
                        ),
                      ),
                    ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top : 10.0, bottom: 10),
                    child: deliveryService(10.00),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: checkOut()
                  ),
                ),
              ]
            ) : Container(),
          ),
        )
      ],
    );
  }

}