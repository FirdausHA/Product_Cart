import 'package:example_cart/Bottom.dart';
import 'package:example_cart/Model_product/Watch_model.dart';
import 'package:example_cart/controllers/cart_controller.dart';
import 'package:example_cart/screens/Home.dart';
import 'package:example_cart/screens/Product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailSection extends StatelessWidget {
  DetailSection({required this.Index});
  // buat final untuk memanggil controller
  //final %nama% = Get.put(%nama class controller%);
  final cart_controller = Get.put(CartController());
  int price = 25;

  int Index = 0;
  Widget buildDetailText({required title, required subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: "customFont",
            color: Color(0xfff0deba),
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontFamily: "customFont",
            fontSize: 30,
            color: Color(0xfff0deba),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 460,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Color(0xffffda9c),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (con) => Home(),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      buildDetailText(
                                        title: "BRAND",
                                        subTitle: "BHILFIGERR",
                                      ),
                                      buildDetailText(
                                        title: "STRAP",
                                        subTitle: "SILICONE",
                                      ),
                                      buildDetailText(
                                        title: "COLOR",
                                        subTitle: "ROSE GOLD",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(

                        alignment: Alignment.topRight,
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xfffdd691),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(Product.products[Index].image,
                        scale: 0.5,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          "TOMMY HILFIGER",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffebbb71),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.black,
            height: MediaQuery.of(context).size.height,
width: 340,            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TRENDING PRODUCTS",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "customFont",
                              letterSpacing: 7,
                            ),
                          ),
                          Text(
                            "PRICE",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "customFont",
                              letterSpacing: 7,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Product.products[Index].brand,
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "customFont",
                          ),
                        ),
                        Text("\$${Product.products[Index].price}",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xffffda9c),
                            fontWeight: FontWeight.bold,
                            fontFamily: "customFont",
                            letterSpacing: 7,
                          ),
                        )
                      ],
                    ),
                    Text("${Product.products[Index].description}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: MaterialButton(
                            onPressed: () {},
                            height: 50,
                            color: Color(0xfffdd691),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff303136),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color(0xffffad390),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  cart_controller.addProduct(Product.products[Index]);
                                },
                                icon: Icon(
                                    Icons.shopping_cart
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
