import 'package:example_cart/screens/Cart.dart';
import 'package:example_cart/screens/Product_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Widget/custom_text.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff293f6e),
          iconTheme: IconThemeData(color: Colors.white),
          title: CustomText(
            text: "Watch Store",
            size: 24,
            weight: FontWeight.bold,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: CartPage(),
                    ),
                  );
                })
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          // child: ListView(
          //   children: [
          //     Obx(()=>UserAccountsDrawerHeader(
          //         decoration: BoxDecoration(
          //             color: Colors.black
          //         ),
          //         accountName: Text(userController.userModel.value.name ?? ""),
          //         accountEmail: Text(userController.userModel.value.email ?? ""))),
          //     ListTile(
          //       onTap: () {
          //         userController.signOut();
          //       },
          //       leading: Icon(Icons.exit_to_app),
          //       title: Text("Log out"),
          //     )
          //   ],
          // ),
        ),
        body: Container(
          color: Colors.white30,
          child: ProductPage(),
        ));
  }
}
