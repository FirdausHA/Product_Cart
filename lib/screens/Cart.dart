import 'package:example_cart/Model_product/Watch_model.dart';
import 'package:example_cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final counterC = Get.put(CartController());
  final CartController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff293f6e),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff293f6e),
          elevation: 0,
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "CART",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "Thank You For Choosing Our Product",
                    style: TextStyle(fontSize: 12,color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Obx((() => Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: ListView.separated(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return CartProductCart(
                    controller: controller,
                    product: controller.products.keys.toList()[index],
                    quantity: controller.products.values.toList()[index],
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 10,
                    thickness: 2,
                    color: Colors.white,
                  );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15,right:15),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container( width: MediaQuery.of(context).size.width * 0.45,
                                child: Text("TOTAL ",
                                  style: TextStyle(color: Colors.white, fontSize: 30,letterSpacing: 1,fontFamily: "customFont"),),),
                              Container( width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(controller.listShoppingCartTotal() + " \$",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 20, letterSpacing: 1),),)
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Color(0xfffdd691), ),
                            onPressed: () {controller.payment();}, child: Container(height: 50,width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text("BUY NOW",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xff293f6e),
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),)),
                      ],
                    )
                ),
              ],
            )
          ],
        ))));
  }
}

class CartProductCart extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartProductCart({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: MediaQuery.of(context).size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Image.asset(
                product.image
            ),
          ),
          Container(
            // color: Colors.blue,
            width: MediaQuery.of(context).size.width * 0.30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                Text(product.price.toString() + " K",style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeproduct(product);
                    },
                    icon: Icon(Icons.remove_circle,color: Color(0xffFFB103), ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.080,
                      child: Text(
                        "${quantity}",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,color: Colors.white),
                      )),
                  IconButton(
                      onPressed: () {
                        controller.addProduct(product);
                      }, icon: Icon(Icons.add_circle,color: Color(0xffFFB103)))
                ],
              ))
        ],
      ),
    );
  }
}




