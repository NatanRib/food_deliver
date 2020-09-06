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

    var screenHeight = (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top);

    return Scaffold(
      body: SafeArea(
        child: Obx(
          ()=> Stack(
            children: [
              Positioned( //CARRINHO OCULTO
                top: cartController.cartFinal? 15 : 10,
                right: cartController.cartFinal? 15 :  10,
                child: ShoppingCartWidgets().cart(cartController.totalOrder())
              ),
              AnimatedOpacity(//
                duration: Duration(milliseconds: 700),
                opacity: cartController.cartFinal? 0: cartController.cartStart? 0 : 1,
                child: IgnorePointer(
                  ignoring: cartController.cartStart,
                  child: Container(
                    child: ListView(
                      children: [
                        Row( //CABEÇALHO
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(//LOGO
                              padding: const EdgeInsets.only(left: 10.0),
                              child: homeWidgets.logo(),
                            ),
                            GetBuilder<CartController>(builder: (_)=> Container(//BOTAO ACIONA CARRINHO
                                padding: const EdgeInsets.only(top: 10, right: 10),
                                child: GestureDetector(
                                  onTap: (){
                                    print('acionando carrinho');
                                    cartController.cartStart = !cartController.cartStart;},
                                  child: homeWidgets.shoppingChart(
                                    _.cart.items.length
                                  ),
                                ),
                                height: Get.height * 0.13,
                                width: 100,
                              ),
                            )
                          ],
                        ),
                        Padding(//SEARCH **PRECISO EMPREMENTAR
                          padding: const EdgeInsets.only(top:20, left: 10, right: 10),
                          child: homeWidgets.searchTextField(),
                        ),
                        GetBuilder<CategoryController>(builder: (_) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(//CATEGORIAS
                                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                                child: SizedBox(
                                  height: Get.height/6,
                                  width: Get.width,
                                  child: ListView.builder( //categorias
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
                                            child: homeWidgets.cardIcon(_.categories[index].name,
                                              _.categories[index].name ==
                                              _.selectedCategory ?
                                                true : false)
                                            
                                          ),
                                          Container(width: 10,)
                                        ],
                                      );
                                    }
                                  ),
                                ),
                              ),
                              Padding(//TEXTO CATEGORIA
                                padding: const EdgeInsets.only(top: 20, left: 10),
                                child: homeWidgets.textMenu(_.selectedCategory),
                              ),
                            ],
                          )
                        ),
                        GetBuilder<ItemController>(builder: (_) { 
                          return Container(//GRID DE ITENS DA CATEGORIA
                            height: Get.height * 0.74,
                            width: Get.width,
                            padding: const EdgeInsets.only(top: 10.0),
                            child: GridView.count(
                              physics: ScrollPhysics(),
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 10,
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
                ),
              )
            ]
          ),
        )
      )
    );
  }
}