import 'package:example_cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';


class PaymentProccess extends StatelessWidget {
  PaymentProccess({super.key});
  final counterC = Get.put(CartController());
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff293f6e),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container( width: MediaQuery.of(context).size.width * 0.30, child: Image.asset('images/Gold_3.png'),),
              SizedBox(height: 10,),
              Center(child: Text("PAYMENT SUCCES",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
              SizedBox(height: 20,),
              Center(child: Text("See You Later",style: TextStyle(color: Colors.white))),
              SizedBox(height: 30,),
              ElevatedButton( style: ElevatedButton.styleFrom(primary: Color(0xfffdd691)), onPressed: () {controller.clear(); Navigator.pop(context);}, child: Text("OK",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
            ],
          ),
        ],
      ),
    );
  }
}