import 'package:flutter/material.dart';
import 'package:food_delivery/app/data/model/category.dart';
import 'package:food_delivery/app/data/model/cart.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';

class HomeWidgets {
  Widget shoppingChart(int numberOfItens) {
    return Container(
      decoration: BoxDecoration(
          color: Get.theme.accentColor,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            color: Get.theme.primaryColor,
          ),
           numberOfItens == null
              ? Container()
              : numberOfItens <= 0
                  ? Container()
                  : Text(
                      numberOfItens.toString(),
                      style: TextStyle(color: Get.theme.primaryColor),
                    )
        ],
      )),
    );
  }

  Widget logo() {
    return Icon(
      //substituir pela logo
      Icons.show_chart,
      color: Get.theme.accentColor,
      size: 50,
    );
  }

  Widget searchTextField() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: 'Search',
          fillColor: Get.theme.backgroundColor,
          filled: true,
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(15))),
    );
  }

  Widget cardIcon(String nameOfCategory /*IconData icon*/, bool selected) {
    return Container(
      // height: 70,
      width: Get.width * 0.3,
      child: Material(
        color: selected ? Colors.black : Get.theme.backgroundColor,
        elevation: selected ? 10 : 0,
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child: Text(
            nameOfCategory,
            style: TextStyle(color: selected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget textMenu(String cat) {
    return Text(
      cat + ' menu',
      style: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget cardItem(Item i) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Get.theme.backgroundColor),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              i.name,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Hero(
              tag: '${i.urlImage} + ${i.name}',
              child: Image(
                image: AssetImage(i.urlImage),
                height: 100,
                alignment: Alignment.center,
              ),
            ),
            Text(
              'R\$ ' + i.price.toStringAsFixed(2),
              style: TextStyle(color: Get.theme.accentColor, fontSize: 16),
            )
          ]),
    );
  }
}
