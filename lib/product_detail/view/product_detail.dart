import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/home/view/home_screen.dart";
import "package:groceries_store_app/product_detail/cubit/product_state.dart";
import "package:groceries_store_app/product_detail/cubit/product_cubit.dart";

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  // Helper method để hiển thị snackbar
  void _showSnackBar(
    BuildContext context,
    String message, {
    Color color = Colors.green,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(),
      // Sử dụng ProductDetailState base class
      child: BlocConsumer<ProductCubit, ProductDetailState>(
        listener: (context, state) {
          // Xử lý thông báo thành công
          if (state is ProductAddedToBasketSuccess) {
            _showSnackBar(
              context,
              "${state.productName} added to basket successfully!",
              color: const Color(0xff53B175),
            );
          }
          // Xử lý thông báo lỗi
          else if (state is ProductFailureState) {
            _showSnackBar(
              context,
              "Error: ${state.productError}",
              color: Colors.red,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();

          // Dữ liệu UI phải được lấy từ ProductReadyState
          final ProductReadyState? readyState = state is ProductReadyState
              ? state
              : (cubit.state is ProductReadyState
                    ? cubit.state as ProductReadyState
                    : null);

          // Kiểm tra trạng thái loading để hiển thị spinner
          final bool isLoading = state is ProductLoadingState;

          // Nếu không có dữ liệu sẵn sàng (chỉ xảy ra ở trạng thái lỗi nghiêm trọng/khởi tạo),
          // ta có thể hiển thị một spinner toàn màn hình hoặc một widget lỗi.
          if (readyState == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // Sử dụng readyState cho các giá trị UI
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // ... (Phần UI trên giữ nguyên, chỉ thay đổi state)
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
                                    Navigator.pop(
                                      context,
                                    ); // Thường là pop thay vì push Home
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
                          Container(child: Image.asset(readyState.image)),
                          const SizedBox(height: 10),
                          // ... (Dots/Bar giữ nguyên)
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
                              readyState.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: cubit.toggleHeart,
                              child: Image.asset(
                                !readyState.isHeart
                                    ? "assets/images/grey_heart.png"
                                    : "assets/images/red_heart.png",
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                        // ... (1kg, Price text giữ nguyên)
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
                                  onPressed: readyState.quantity > 1
                                      ? cubit.decrementQuantity
                                      : null,
                                  icon: Icon(
                                    Icons.remove,
                                    color: readyState.quantity > 1
                                        ? const Color(0xff53B175)
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
                                    "${readyState.quantity}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed:
                                      readyState.quantity <
                                          readyState.maxQuantity
                                      ? cubit.incrementQuantity
                                      : null,
                                  icon: Icon(
                                    Icons.add,
                                    color:
                                        readyState.quantity <
                                            readyState.maxQuantity
                                        ? const Color(0xff53B175)
                                        : const Color(0xff888888),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    "\$${(readyState.price * readyState.quantity).toStringAsFixed(2)}",
                                    style: const TextStyle(
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
                        // ... (Product Detail, Nutritions, Review sections giữ nguyên)
                        const SizedBox(height: 15),
                        Image.asset("assets/images/line.png"),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
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
                          readyState.detail,
                          style: const TextStyle(
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
                            const Text(
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
                            const Text(
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
                  // --- ADD TO BASKET BUTTON ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 67,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : cubit.addBasket, // Disable button while loading
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xff53B175,
                          ), // Màu xanh cố định
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
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
