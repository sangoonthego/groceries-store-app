import "package:flutter/material.dart";
import "package:hello_world/login_ui.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetail(),
    );
  }
}

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _counter = 1;
  double apple_price = 4.99;
  int max_count = 5;

  bool _heartChangeColor = false;

  void onHeartChangeColorClicked() {
    setState(() {
      _heartChangeColor = !_heartChangeColor;
    });
  }

  void onAddToBasketClicked() {
    setState(() {
      print("Added $_counter to the basket.");
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // Widget _quantitySelector() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey),
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: Row(
  //       children: <Widget>[
  //         FloatingActionButton(
  //           onPressed: _incrementCounter,
  //           tooltip: "Increment",
  //           child: const Icon(Icons.add),
  //         ),
  //         FloatingActionButton(
  //           onPressed: _decrementCounter,
  //           tooltip: "Decrement",
  //           child: const Icon(Icons.remove),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Image.asset("assets/images/frame.png"),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Image.asset("assets/images/left_arrow.png"),
                          ),
                          Image.asset("assets/images/download_button.png"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(child: Image.asset("assets/images/apple2.png")),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/short_bar.png"),
                        const SizedBox(width: 5),
                        Image.asset("assets/images/tiny_dot.png"),
                        const SizedBox(width: 5),
                        Image.asset("assets/images/tiny_dot.png"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Natural Red Apple",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: onHeartChangeColorClicked,
                        child: Image.asset(
                          !_heartChangeColor
                              ? "assets/images/grey_heart.png"
                              : "assets/images/red_heart.png",
                          width: 30,
                        ),
                      ),
                      //Image.asset("assets/images/heart.png"),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "1kg, Price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff888888),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: _counter > 1 ? _decrementCounter : null,
                            icon: Icon(
                              Icons.remove,
                              color: _counter > 1
                                  ? Color(0xff53B175)
                                  : Colors.grey,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "$_counter",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: _counter < max_count
                                ? _incrementCounter
                                : null,
                            icon: Icon(
                              Icons.add,
                              color: _counter < max_count
                                  ? Color(0xff53B175)
                                  : Color(0xff888888),
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: <Widget>[
                      //     Text(
                      //       "\$4.99",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 16,
                      //         color: Colors.black,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Color(0xff888888)),
                            //   borderRadius: BorderRadius.circular(15),
                            // ),
                            child: Text(
                              "\$${(apple_price * _counter).toStringAsFixed(2)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Image.asset("assets/images/line.png"),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Product Detail",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset("assets/images/down_arrow.png"),
                    ],
                  ),
                  Text(
                    "Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healthful And Varied Diet.",
                    style: TextStyle(fontSize: 13, color: Color(0xff888888)),
                  ),
                  const SizedBox(height: 15),
                  Image.asset("assets/images/line.png"),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Nutritions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/right_arrow.png"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Image.asset("assets/images/line.png"),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Review",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/images/star.png"),
                          const SizedBox(width: 10),
                          Image.asset("assets/images/right_arrow.png"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Image.asset("assets/images/line.png"),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 67,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onAddToBasketClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Add to Basket",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
