import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/cart/cubit/cart_state.dart";

class CartCubit extends Cubit<CartState> {
  final List<FoodType> _foodTypes = const [
    FoodType(name: "Fruit & Vegetable", image: "assets/images/frash_fruit.png"),
    FoodType(name: "Meat & Fish", image: "assets/images/meat_fish.png"),
    FoodType(name: "Dairy & Egg", image: "assets/images/dairy_eggs.png"),
    FoodType(name: "Oil", image: "assets/images/cooking_oil.png"),
    FoodType(name: "Bakery", image: "assets/images/bakery_snacks.png"),
    FoodType(name: "Beverage", image: "assets/images/beverages.png"),
  ];

  CartCubit()
    : super(
        const CartState(foodTypes: [], isDropdownOpen: false, selectedIndex: 2),
      ) {
    emit(state.copyWith(foodTypes: _foodTypes));
  }

  void toggleDropdown() {
    emit(state.copyWith(isDropdownOpen: !state.isDropdownOpen));
  }

  void selectedItem(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
