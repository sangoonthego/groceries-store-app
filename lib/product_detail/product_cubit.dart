import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/product_detail/product_state.dart";

class ProductCubit extends Cubit<ProductState> {
  ProductCubit()
    : super(
        ProductState(
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

  void incrementQuantity() {
    if (state.quantity < 5) {
      emit(state.copyWith(quantity: state.quantity + 1));
    }
  }

  void decrementQuantity() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void toggleHeart() {
    emit(state.copyWith(isHeart: !state.isHeart));
  }

  void addBasket() {}
}
