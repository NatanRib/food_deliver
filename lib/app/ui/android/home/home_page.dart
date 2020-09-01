import 'package:flutter/material.dart';
import 'package:food_delivery/app/controller/details_controller.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Row( //cabeçalho
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: homeWidgets.logo(),
                  ),
                  Obx(()=> Container(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: homeWidgets.shoppingChart(cartController.cart),
                    height: Get.height * 0.13,
                    width: 100,
                  ))
                ],
              ),
              Padding(//search
                padding: const EdgeInsets.only(top:20, left: 10, right: 10),
                child: homeWidgets.searchTextField(),
              ),
              Obx( () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                      child: SizedBox(
                        height: Get.height/6,
                        width: Get.width,
                        child: ListView.builder( //categorias
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryController.categories.length,
                          itemBuilder: (context, index){
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    categoryController.changeCategory(
                                    categoryController.categories[index].name);
                                    itemController.getByCategory(categoryController.categories[index].name);
                                  },
                                  child: homeWidgets.cardIcon(categoryController.categories[index],
                                    categoryController.categories[index].name ==
                                     categoryController.selectedcategory ?
                                      true : false)
                                  
                                ),
                                Container(width: 10,)
                              ],
                            );
                          }
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: homeWidgets.textMenu(categoryController.selectedcategory),
                    ),
                  ],
                )
              ),
              Obx(() { 
                return Container(
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
                      itemController.selectedItems.length, 
                      (index) => GestureDetector(
                        onTap: () {
                          final detailsController = Get.put(DetailsController(
                            itemController.selectedItems[index]
                          ));
                          Get.toNamed('/details', arguments: detailsController);},
                        child: homeWidgets.cardItem(itemController.selectedItems[index]),
                      )
                    ),
                  ),  
                );
              }) 
            ],
          ),
        ),
      )
    );
  }
}