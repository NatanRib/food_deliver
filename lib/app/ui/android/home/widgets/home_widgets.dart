import 'package:flutter/material.dart';
import 'package:food_delivery/app/data/model/category.dart';
import 'package:food_delivery/app/data/model/chart.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';

class HomeWidgets{

  Widget shoppingChart(Chart c){
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.accentColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart,
              color: Get.theme.primaryColor,
            ),
            c.items > 0 ? 
              Text(c.items.toString(),
                style: TextStyle(
                  color: Get.theme.primaryColor
                ),
              ) :
              Container()
          ],
        )
      ),
    );
  }

  Widget logo(){
    return Icon(//substituir pela logo
      Icons.show_chart,
      color: Get.theme.accentColor,
      size: 50,
      );
  }

  Widget searchTextField(){
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.black,),
        hintText: 'Search',
        fillColor: Get.theme.backgroundColor,
        filled: true,
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15)
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15)
        )
      ),
    );
  }

  Widget cardIcon(Category cat/*IconData icon*/, bool selected){
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selected ? Colors.black :Get.theme.backgroundColor,
      ),
      child: Center(
        child: Text(cat.name,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }

  Widget textMenu(String cat){
    return Text(
      cat + ' menu',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget cardItem(Item i){
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.theme.backgroundColor
      ),
      height: 130,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(i.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16
            ),
          ),
          Text('R\$ ' +i.price.toString(),
            style: TextStyle(
              color: Colors.green[800]
            ),
          )
        ]
      ),
    );
  }
}