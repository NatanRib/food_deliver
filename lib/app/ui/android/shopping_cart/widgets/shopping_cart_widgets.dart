import 'package:flutter/material.dart';
import 'package:food_delivery/app/data/model/item.dart';
import 'package:get/get.dart';

class ShoppingCartWidgets{

  Widget cardItem(Item i){
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
                  Text(i.name,
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('R\$ ' + i.price.toString())
                ],
              ),
            ),
          ),
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            child: Align(
              alignment: Alignment.centerRight,
                child:  Row(
                  children: [
                    Container(
                      width: 40,
                      child: RaisedButton(
                        elevation: 10,
                        color: Colors.black,
                        onPressed: (){},
                        child: Text('+', style: TextStyle(fontSize: 22, color: Get.theme.primaryColor),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                      child: Text(i.qtd.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.primaryColor,
                        )
                      ),
                    ),
                    Container(
                      width: 40,
                      child: RaisedButton(
                        elevation: 10,
                        color: Get.theme.primaryColor,
                        onPressed: (){},
                        child: Text('-', style: TextStyle(fontSize: 22, color: Colors.black)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
         )
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

  Widget checkOut(double total){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total price'),
            Text('R\$ '+(total).toStringAsFixed(2),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Container(
                width: 50,
                height: Get.height,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  color: Colors.white,
                  onPressed: ()=> Get.back(), 
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
                onPressed: (){},
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
}