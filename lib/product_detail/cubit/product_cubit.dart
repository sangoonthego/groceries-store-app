import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/product_detail/cubit/product_state.dart";

class ProductCubit extends Cubit<ProductDetailState> {
  ProductCubit()
    : super(
        const ProductReadyState(
          name: "Natural Red Apple",
          image: "assets/images/apple2.png",
          detail:
              "Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healthful And Varied Diet.",
          price: 4.99,
          quantity: 1,
          maxQuantity: 5,
          isHeart: false,
        ),
      );

  // Helper để truy cập dữ liệu hiện tại một cách an toàn
  ProductReadyState get readyState => state as ProductReadyState;

  void incrementQuantity() {
    if (state is ProductReadyState &&
        readyState.quantity < readyState.maxQuantity) {
      emit(readyState.copyWith(quantity: readyState.quantity + 1));
    }
  }

  void decrementQuantity() {
    if (state is ProductReadyState && readyState.quantity > 1) {
      emit(readyState.copyWith(quantity: readyState.quantity - 1));
    }
  }

  void toggleHeart() {
    if (state is ProductReadyState) {
      emit(readyState.copyWith(isHeart: !readyState.isHeart));
    }
  }

  void addBasket() async {
    if (state is! ProductReadyState) return;

    final dataToAdd = readyState;

    emit(const ProductLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    if (dataToAdd.quantity > 4) {
      emit(
        const ProductFailureState(
          "Quantity exceeds the maximum order limit (Max 4 for test)!",
        ),
      );
      emit(dataToAdd);
    } else {
      emit(ProductAddedToBasketSuccess(dataToAdd.name));

      emit(dataToAdd);
    }
  }
}
