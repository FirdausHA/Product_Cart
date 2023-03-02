import 'package:example_cart/Responsive/DetailSectionTablet.dart';
import 'package:example_cart/screens/Detail_product.dart';
import 'package:flutter/material.dart';

  class DetailResponsive extends StatelessWidget {
  int Indexs = 0;
  DetailResponsive({required this.Indexs});

  @override
  Widget build(BuildContext context) {
    final currentwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: currentwidth < 600 ? DetailProduct(Index: Indexs,) : DetailSection(
        Index: Indexs,),
    );
  }
}