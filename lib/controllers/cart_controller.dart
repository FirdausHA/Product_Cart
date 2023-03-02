import 'package:example_cart/Model_product/Watch_model.dart';
import 'package:example_cart/screens/Pembayaran.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // add a dict to store the product in cart
  var _products = {}.obs;

  RxInt productcount = 0.obs;

  void reset() {
    productcount = 1.obs;
  }

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Product add",
      "You have added the ${product.name} to the cart",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 1),
    );
  }

  void clear() {
    _products.value = {};
    Get.snackbar("On Our way", "your order will arrive soon",colorText: Colors.white);
    SnackPosition: SnackPosition.BOTTOM;
    duration: Duration(seconds: 2);

  }

  void removeproduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -=1;
    }
  }

  void payment() {
    if (_products?.isEmpty ?? true) {
      Get.snackbar("Cart is Empty", "add a product to continue payment",colorText: Colors.white);
      SnackPosition: SnackPosition.BOTTOM;
      duration: Duration(seconds: 2);
    } else {
      Get.to(PaymentProccess());
    }
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  String listShoppingCartTotal() => products.isNotEmpty
      ? products.entries
      .map((product) => product.key.price! * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(0)
      : '0';
}
