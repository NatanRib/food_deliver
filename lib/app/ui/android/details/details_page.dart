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
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, contraints){
            print('heigth: ${contraints.maxHeight} width: ${contraints.maxWidth}');
            return Obx(()=> Stack(
              children: [
                Positioned(   //CARRINHO, A PRINCIPIO ESCONDIDO
                  top: cartController.cartFinal? 15 : 10,
                  right: cartController.cartFinal? 15 :  10,
                  child: ShoppingCartWidgets().cart()
                ),
                AnimatedOpacity(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 500),
                  opacity: cartController.cartFinal ? 0 : cartController.cartStart ? 0 : 1,
                  child: IgnorePointer(
                    ignoring: cartController.cartStart,
                    child: Column(
                      children: [
                        Container(
                          height: contraints.maxHeight * 0.13,
                          width: contraints.maxWidth,
                          child: Stack(   //CABEÇALHO
                            // mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(    //BOTÃO VOLTAR
                                padding: const EdgeInsets.only( top: 10.0, left: 10.0),
                                width: contraints.maxWidth * 0.24,
                                height: contraints.maxHeight * 0.14,
                                child: detailsWidgets.backButton((){ 
                                  Get.delete<DetailsController>();
                                  Get.offNamed('/');
                                }),
                              ),
                              Positioned(   //NOME CATEGORIA
                                top: contraints.maxHeight * 0.05,
                                left: contraints.maxWidth * 0.4,
                                child: detailsWidgets.categoryName(detailsController.item.category)
                              ),
                              Positioned(   //BOTAO CARRINHO
                                top: 10,
                                right: 10,
                                child: Container(
                                  height: contraints.maxHeight * 0.11,
                                  width: contraints.maxWidth * 0.25,
                                  child: GestureDetector(
                                    onTap: ()=> cartController.cartStart= !cartController.cartStart,
                                    child: GetBuilder<CartController>(builder: (_)=> detailsWidgets.shoppingCart(cartController.cart.items.length))
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        Row(    //CORPO DA PAGINA
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 15, left: 10),
                              height: contraints.maxHeight * 0.87,
                              width: Get.width * 0.23,
                              child: GetBuilder<ItemController>(
                                builder: (_)=> ListView.builder( 
                                  itemCount: _.selectedItems.length,
                                  itemBuilder: (context, index){
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () { detailsController.changeItem(
                                            itemController.selectedItems[index]);
                                          },
                                          child: GetBuilder<DetailsController>(
                                            builder: (_)=> Container(
                                              height: contraints.maxHeight * 0.12,
                                              child: detailsWidgets.cardOtherItems(
                                                itemController.selectedItems[index],
                                                itemController.selectedItems[index] == _.item ?
                                                true : false
                                          ),
                                            ))
                                        ),
                                        Container(height: contraints.maxHeight * 0.017)
                                      ],
                                    );
                                  }
                                )
                              ),
                            ),
                            Container(    //ITEM SELECIONADO
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              height: contraints.maxHeight * 0.87,
                              width: contraints.maxWidth * 0.77,
                              child: ListView(    
                                children: [
                                  GetBuilder<DetailsController>(
                                    builder: (_)=> Container(
                                      height: contraints.maxHeight * 0.9,
                                      width: contraints.maxWidth * 0.8,
                                      child: detailsWidgets.cardSelected(
                                        detailsController.item,
                                        ()=> detailsController.increaseQtd(),
                                        ()=> detailsController.decreaseQtd()
                                      ),
                                    )
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
            )
          );
        }),
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