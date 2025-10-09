import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_store_app/cart/cubit/cart_state.dart';
import 'package:groceries_store_app/cart/cubit/food_detail_state.dart';

class FoodDetailCubit extends Cubit<FoodDetailState> {
  FoodDetailCubit({required FoodType initialFoodType})
    : super(
        FoodDetailState(
          foodType: initialFoodType,
          items: _loadItemsFor(initialFoodType.name),
          isSelectItemDropdownOpen: false,
          selectedItem: null,
        ),
      );

  static List<FoodItem> _loadItemsFor(String foodTypeName) {
    switch (foodTypeName) {
      case "Fruit & Vegetable":
        return const [
          FoodItem(
            name: "Banana",
            image: "assets/images/apple2.png",
            price: 2.99,
            unit: "Organic",
          ),
          FoodItem(
            name: "Apple",
            image: "assets/images/apple2.png",
            price: 4.99,
            unit: "Red Apple",
          ),
          FoodItem(
            name: "Bell Pepper",
            image: "assets/images/pepper_red.png",
            price: 1.50,
            unit: "Mix colors",
          ),
          FoodItem(
            name: "Ginger",
            image: "assets/images/ginger.png",
            price: 5.50,
            unit: "Fresh",
          ),
        ];
      case "Meat & Fish":
        return const [
          FoodItem(
            name: "Chicken Breast",
            image: "assets/images/meat_fish.png",
            price: 12.00,
            unit: "1kg",
          ),
          FoodItem(
            name: "Salmon",
            image: "assets/images/meat_fish.png",
            price: 25.50,
            unit: "Fillet",
          ),
        ];
      default:
        return const [];
    }
  }

  void toggleSelectItemDropdown() {
    emit(
      state.copyWith(isSelectItemDropdownOpen: !state.isSelectItemDropdownOpen),
    );
  }

  void selectItem(FoodItem item) {
    emit(state.copyWith(isSelectItemDropdownOpen: false, selectedItem: item));
  }
}
