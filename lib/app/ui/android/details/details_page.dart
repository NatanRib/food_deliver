import 'package:flutter/material.dart';
import 'package:food_delivery/app/controller/cart_controller.dart';
import 'package:food_delivery/app/controller/details_controller.dart';
import 'package:food_delivery/app/controller/item_controller.dart';
import 'package:food_delivery/app/data/repository/cart_repository.dart';
import 'package:food_delivery/app/data/repository/item_repository.dart';
import 'package:get/get.dart';
import 'package:food_delivery/app/ui/android/details/widgets/details_widgets.dart';

class DetaisPage extends StatelessWidget {

  final detailsWidgets = Get.put(DetailsWidgets());
  final itemController = Get.put(ItemController(repository: ItemRepository()));
  final cartController = Get.put(CartController(repository: CartRepository()));
  
  DetaisPage();
  final DetailsController detailsController = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Stack( //cabecalho
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only( top: 10.0, left: 10.0),
                    child: detailsWidgets.backButton((){ 
                      Get.delete<DetailsController>();
                      Get.back();
                      //Get.offAndToNamed('/');
                    }),
                  ),
                  Positioned(
                    top: Get.height * 0.05,
                    left: Get.width * 0.40,
                    child: detailsWidgets.categoryName(detailsController.item.category)
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: Get.height * 0.11,
                      width: Get.width * 0.25,
                      child: detailsWidgets.shoppingCart(
                        (){},
                        cartController.cart
                      ),
                    )
                  )
                ],
              ),
            ),
            Obx (() => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: Get.height - 119,
                        width: Get.width * 0.6,
                        child: ListView(
                          children: [
                            detailsWidgets.cardSelected(detailsController.item)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: SizedBox(
                    height: Get.height - 119,
                    width: Get.width * 0.3,
                    child: ListView.builder(
                      itemCount: itemController.selectedItems.length,
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => detailsController.changeItem(
                                itemController.selectedItems[index]),
                              child: detailsWidgets.cardItems(
                                itemController.selectedItems[index],
                                itemController.selectedItems[index] == detailsController.item ?
                                true : false
                              )
                            ),
                            Container(height: 8)
                          ],
                        );
                      }
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}