import 'package:example_cart/Responsive/ProductSectionTablet.dart';
import 'package:example_cart/screens/Product_page.dart';
import 'package:flutter/material.dart';

class ProductPageResponsive extends StatelessWidget {
  const ProductPageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: currentwidth < 600 ? ProductPage() : ProductSection(),
    );
  }
}
