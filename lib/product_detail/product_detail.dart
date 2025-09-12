import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/home/home_screen.dart";
import "package:groceries_store_app/product_detail/product_state.dart";
import "package:groceries_store_app/product_detail/product_cubit.dart";

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return BlocProvider(
      create: (_) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();
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
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/images/left_arrow.png",
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/download_button.png",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(child: Image.asset(state.image)),
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
                              state.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: cubit.toggleHeart,
                              child: Image.asset(
                                !state.isHeart
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
                                  onPressed: state.quantity > 1
                                      ? cubit.decrementQuantity
                                      : null,
                                  icon: Icon(
                                    Icons.remove,
                                    color: state.quantity > 1
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
                                    "${state.quantity}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: state.quantity < state.maxQuantity
                                      ? cubit.incrementQuantity
                                      : null,
                                  icon: Icon(
                                    Icons.add,
                                    color: state.quantity < state.maxQuantity
                                        ? Color(0xff53B175)
                                        : Color(0xff888888),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),

                                  child: Text(
                                    "\$${(state.price * state.quantity).toStringAsFixed(2)}",
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
                          state.detail,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff888888),
                          ),
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
                        onPressed: cubit.addBasket,
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
        },
      ),
    );
  }
}
