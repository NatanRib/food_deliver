import 'package:flutter/material.dart';
import 'package:food_delivery/app/ui/android/shopping_cart/widgets/shopping_cart_widgets.dart';
import 'package:get/get.dart';
import 'package:food_delivery/app/ui/android/home/widgets/home_widgets.dart';
import 'package:food_delivery/app/controller/cart_controller.dart';
import 'package:food_delivery/app/controller/category_controller.dart';
import 'package:food_delivery/app/controller/item_controller.dart';
import 'package:food_delivery/app/data/repository/category_repository.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';
import 'package:food_delivery/app/data/repository/item_repository.dart';

class HomePage extends StatelessWidget {
  final homeWidgets = Get.put(HomeWidgets());
  final cartController = Get.put(CartController(repository: CartRepository()));
  final categoryController = Get.put(CategoryController(repository: CategoryRepository()));
  final itemController = Get.put(ItemController(repository: ItemRepository()));

  @override
  Widget build(BuildContext context) {

    //se tiver app bar temos que tirar o tamanho dela, colocamos em uma variavel e acessamos pelo 
    //appBar.preferredSize.height

    //var screenHeight = (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, contraints) {
            print('heigth: ${contraints.maxHeight} width: ${contraints.maxWidth}');
            return Obx(()=> Stack(
              children: [
                Positioned(   //CARRINHO OCULTO
                  top: cartController.cartFinal? 15 : 10,
                  right: cartController.cartFinal? 15 :  10,
                  child: ShoppingCartWidgets().cart()
                ),
                AnimatedOpacity(//
                  duration: Duration(milliseconds: 500),
                  opacity: cartController.cartFinal? 0: cartController.cartStart? 0 : 1,
                  child: IgnorePointer(
                    ignoring: cartController.cartStart,
                    child: ListView(
                      children: [
                        Container(    //CABEÇALHO
                          height: contraints.maxHeight * 0.13,
                          padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                          child: Row( 
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(    //LOGO
                                padding: const EdgeInsets.only(left: 10.0),
                                child: homeWidgets.logo(),
                              ),
                              GetBuilder<CartController>(
                                builder: (_)=> Container(   //BOTAO ACIONA CARRINHO
                                  width: contraints.maxWidth * 0.28,
                                  child: GestureDetector(
                                    onTap: (){
                                      cartController.cartStart = !cartController.cartStart;},
                                    child: homeWidgets.shoppingChart(
                                      _.cart.items.length
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(    //SEARCH **PRECISO EMPREMENTAR
                          height: contraints.maxHeight * 0.15,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20, left: 10, right: 10),
                            child: homeWidgets.searchTextField(),
                          ),
                        ),
                        GetBuilder<CategoryController>(
                          builder: (_) => Container(    //CATEGORIAS
                            height: contraints.maxHeight * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 2, right: 2),
                                  child: Container(
                                    height: contraints.maxHeight * 0.19,
                                    width: Get.width,
                                    child: ListView.builder( //lista de cards das categorias
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _.categories.length,
                                      itemBuilder: (context, index){
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _.changeCategory(
                                                _.categories[index].name);
                                                itemController.getByCategory(_.categories[index].name);
                                              },
                                              child: Container(
                                                height: contraints.maxHeight * 0.13,
                                                child: homeWidgets.cardIcon(_.categories[index].name,
                                                  _.categories[index].name ==
                                                  _.selectedCategory ?
                                                    true : false),
                                              )
                                              
                                            ),
                                            Container(width: 10,)
                                          ],
                                        );
                                      }
                                    ),
                                  ),
                                ),
                                Container(    //TEXTO CATEGORIA
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: homeWidgets.textMenu(_.selectedCategory),
                                  ),
                                ),
                              ],
                            ),
                        )
                        ),
                        GetBuilder<ItemController>(builder: (_) { 
                          return Container(   //GRID DE ITENS DA CATEGORIA
                            height: contraints.maxHeight * 0.75,
                            //padding: const EdgeInsets.only(top: 10.0),
                            child: GridView.count(
                              physics: ScrollPhysics(),
                              childAspectRatio: 0.74,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2,
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              children: List<Widget>.generate(
                                _.selectedItems.length, 
                                (index) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/details', arguments: _.selectedItems[index]);},
                                  child: homeWidgets.cardItem(_.selectedItems[index]),
                                )
                              ),
                            ),  
                          );
                        }) 
                      ],
                    ),
                  ),
                )
              ]
            ));
          }
        ),
      )
    );
  }
}