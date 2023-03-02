import 'package:example_cart/Responsive/CartSection.dart';
import 'package:example_cart/screens/Cart.dart';
import 'package:flutter/material.dart';

class CartRespo extends StatelessWidget {
  const CartRespo ({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    return Scaffold(
    body: currentwidth < 600 ? CartPage() : CartSection(),
    );
  }
}
