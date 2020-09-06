import 'package:flutter/material.dart';
import 'package:food_delivery/app/controller/details_controller.dart';
import 'package:food_delivery/app/data/model/cart.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';

class DetailsWidgets{

  Widget backButton(Function f){
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
          width: 2.0
        )
      ),
      child: FlatButton(
        onPressed: f, 
        child: Icon(Icons.arrow_back_ios, color: Colors.black,),
      ),
    );
  }

  Widget shoppingCart(int numberOfItems){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.theme.accentColor,
      ),  
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
            color: Colors.white,
          ),
          numberOfItems == null?
            Container() :
            numberOfItems <= 0 ?
            Container() :
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(numberOfItems.toString(),
              style: TextStyle(
                color: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cardSelected(Item i, Function increase, Function decrease){
    return Container(
      width: Get.width / 2,
      height: 
        i.name.length > 15 ? //nao pode ser mais que 30, definir na api ou no cliente de cadastro de items
        Get.height/1.46 + (i.description.length / 20) * 25 + 20:
        Get.height/1.46 + (i.description.length / 20) * 25,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Image(
              image: AssetImage(i.urlImage),
              alignment: Alignment.center,
              height: Get.height/1.8,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(i.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Expanded(child: Row(
                children: [
                  Container(
                    width: 40,
                    child: RaisedButton(
                      elevation: 5,
                      color: Colors.black,
                      onPressed: increase,
                      child: Text('+', 
                        style: TextStyle(fontSize: 22,color: Get.theme.primaryColor),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                    child:  Text(i.qtd.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      )
                    ),
                  ),
                  Container(
                    width: 40,
                    child: RaisedButton(
                      elevation: 5,
                      color: Get.theme.accentColor,
                      onPressed: decrease,
                      child: Text('-', style: TextStyle(fontSize: 22, color: Colors.black)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ],
              ))
            ],
          ),//imagem of item,
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('R\$ ' + i.price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: Get.theme.accentColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(i.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget categoryName(String name){
    return Text(
      name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20 
      ),  
    );
  }

  Widget cardItems(Item i, bool selected){
    return Container(
      height: 70,
      width: 70,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: selected? Colors.black : Get.theme.backgroundColor,
        elevation: selected ? 10 : 0,
        child: Center(
          child: Text(i.name,
          textAlign: TextAlign.center,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
