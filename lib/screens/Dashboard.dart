import 'package:example_cart/screens/Detail.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  var screenHeight;
  var screenWidth;
  bool favorite = false;

  AppBar buildAppbar() {
    return AppBar(
      // leading: IconButton(
      //   onPressed: () {
      //     _key.currentState!.openDrawer();
      //   },
      //   icon: Icon(
      //     Icons.sort,
      //     color: Color(0xfff0deba),
      //   ),
      // ),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: Icon(Icons.search),
      //   ),
      //   IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.shopping_cart_outlined,
      //     ),
      //   )
      // ],
    );
  }

  Widget buildProductTitle({required title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                letterSpacing: 7,
                fontFamily: "customFont",
                color: Colors.white,
              ),
            ),
            Text(
              "PRODUCTS",
              style: TextStyle(
                letterSpacing: 7,
                fontSize: 30,
                fontFamily: "customFont",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSingleWatchProduct(
      {required image, required title, required subTitle}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (con)=>DetailPage()));
            },
            child: Container(
              alignment: Alignment.topRight,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xfffdd691),
                image: DecorationImage(
                  image: AssetImage("images/$image.png"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: "customFont",
                  letterSpacing: 7,
                  fontSize: screenWidth! / 55,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                subTitle,
                style: TextStyle(
                  fontFamily: "customFont",
                  letterSpacing: 7,
                  fontSize: screenWidth! / 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      appBar: buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildProductTitle(
                      title: "FEATURED",
                    ),
                    Container(
                      height: screenHeight! / 4 - 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffffd792),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "WATCH STORE",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xff2a3d50),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Fashion Men Quartz\nwatch Luxury Leathers\nStrop WAterprof",
                                      style: TextStyle(
                                        color: Color(0xffad8347),
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: MaterialButton(
                                      onPressed: () {},
                                      elevation: 5,
                                      color: Color(0xfffbf9e4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),

                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Buy Now",
                                            style: TextStyle(
                                              color: Color(0xff846b4d),
                                            ),
                                          ),
                                          Flexible(
                                            child: Icon(
                                              Icons.arrow_forward_sharp,
                                              color: Color(0xff846b4d),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Image.asset("images/image1.png"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: screenHeight! / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // scrollDirection: Axis.horizontal,
                children: [
                  buildProductTitle(
                    title: "TRENDING",
                  ),
                  Row(
                    children: [
                      buildSingleWatchProduct(
                        image: "image3",
                        title: "FOSSIL",
                        subTitle: "GRANT WATCH",
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      buildSingleWatchProduct(
                        image: "image2",
                        title: "Tommy HILFIGER",
                        subTitle: "DECKER WATCH",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
