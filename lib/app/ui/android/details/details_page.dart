import 'package:flutter/material.dart';
import 'package:food_delivery/app/controller/cart_controller.dart';
import 'package:food_delivery/app/controller/details_controller.dart';
import 'package:food_delivery/app/controller/item_controller.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';
import 'package:food_delivery/app/data/repository/item_repository.dart';
import 'package:food_delivery/app/ui/android/shopping_cart/widgets/shopping_cart_widgets.dart';
import 'package:get/get.dart';
import 'package:food_delivery/app/ui/android/details/widgets/details_widgets.dart';

class DetaisPage extends StatelessWidget {

  final detailsWidgets = Get.put(DetailsWidgets());
  final itemController = Get.put(ItemController(repository: ItemRepository()));
  final cartController = Get.put(CartController(repository: CartRepository()));
  final detailsController = Get.put(DetailsController(Get.arguments));

  DetaisPage();
  

  @override
  Widget build(BuildContext context) {
    print('update');
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(()=> Stack(
            children: [
              Positioned(//CARRINHO, A PRINCIPIO ESCONDIDO
                top: cartController.cartFinal? 15 : 10,
                right: cartController.cartFinal? 15 :  10,
                child: ShoppingCartWidgets().cart(cartController.totalOrder())
              ),
              AnimatedOpacity(
                curve: Curves.easeOut,
                duration: Duration(milliseconds: 200),
                opacity: cartController.cartFinal ? 0 : cartController.cartStart ? 0 : 1,
                child: IgnorePointer(
                  ignoring: cartController.cartStart,
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        child: Stack( //CABEÇALHO
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(//BOTÃO VOLTAR
                              padding: const EdgeInsets.only( top: 10.0, left: 10.0),
                              child: detailsWidgets.backButton((){ 
                                Get.delete<DetailsController>();
                                Get.offNamed('/');
                              }),
                            ),
                            Positioned(//NOME CATEGORIA
                              top: Get.height * 0.05,
                              left: Get.width * 0.4,
                              child: detailsWidgets.categoryName(detailsController.item.category)
                            ),
                            Positioned(//BOTAO CARRINHO
                              top: 10,
                              right: 10,
                              child: Container(
                                height: Get.height * 0.11,
                                width: Get.width * 0.25,
                                child: GestureDetector(
                                  onTap: ()=> cartController.cartStart= !cartController.cartStart,
                                  child: GetBuilder<CartController>(builder: (_)=> detailsWidgets.shoppingCart(cartController.cart.items.length))
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      Row( //corpo da pagina
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 10.0),
                            child: SizedBox(
                              height: Get.height - 119,
                              width: Get.width * 0.2,
                              child: GetBuilder<ItemController>(
                                builder: (_)=> ListView.builder( //OUTROS ITENS DESSA CATEGORIA
                                  itemCount: _.selectedItems.length,
                                  itemBuilder: (context, index){
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () { detailsController.changeItem(
                                            itemController.selectedItems[index]);
                                          },
                                          child: GetBuilder<DetailsController>(
                                            builder: (_)=> detailsWidgets.cardItems(
                                            itemController.selectedItems[index],
                                            itemController.selectedItems[index] == _.item ?
                                            true : false
                                          ))
                                        ),
                                        Container(height: 10)
                                      ],
                                    );
                                  }
                                )
                              ),
                            ),
                          ),
                          Padding(//ITEM SELECIONADO
                            padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: Get.height - 119,
                                  width: Get.width * 0.7,
                                  child: ListView(//card do item selecionado
                                    children: [
                                      GetBuilder<DetailsController>(
                                        builder: (_)=> detailsWidgets.cardSelected(
                                          detailsController.item,
                                          ()=> detailsController.increaseQtd(),
                                          ()=> detailsController.decreaseQtd()
                                        )
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]
          )),
        ),
      ),
      floatingActionButton: Obx(()=> cartController.cartFinal ? Container():
       cartController.cartStart ? Container() : FloatingActionButton(
        backgroundColor: Get.theme.accentColor,
        autofocus: false,
        onPressed: (){
          print('pressionado');
          cartController.addOne(detailsController.item);
          detailsController.resetQtd();
        }, 
        child: Icon(Icons.add_shopping_cart, color: Colors.white,),
      ),
    ));
  }
}