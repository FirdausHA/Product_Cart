import 'package:example_cart/Model_product/Watch_model.dart';
import 'package:example_cart/Responsive/Detail_Responsive.dart';
import 'package:example_cart/Responsive/Product_Renponsive.dart';
import 'package:example_cart/controllers/cart_controller.dart';
import 'package:example_cart/screens/Detail_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 240,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Product_Card(index: index);
          },
        ),
      ),
    );
  }
}

class Product_Card extends StatelessWidget {
  final int index;
  final cart_controller = Get.put(CartController());
  Product_Card({super.key,required this.index});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailResponsive(Indexs: index)));
        cart_controller.reset();
      },
      child: Container(
        alignment: Alignment.topRight,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfffdd691),
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(Product.products[index].image,
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("${Product.products[index].name}",
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "customFont",
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
