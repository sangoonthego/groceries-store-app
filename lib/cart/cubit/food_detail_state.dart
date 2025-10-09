import "package:equatable/equatable.dart";
import "package:groceries_store_app/cart/cubit/cart_state.dart";

class FoodItem extends Equatable {
  final String name;
  final String image;
  final double price;
  final String unit;

  const FoodItem({
    required this.name,
    required this.image,
    required this.price,
    required this.unit,
  });

  @override
  List<Object?> get props => [name, image, price, unit];
}

class FoodDetailState extends Equatable {
  final FoodType foodType;
  final List<FoodItem> items;
  final bool isSelectItemDropdownOpen;
  final FoodItem? selectedItem;

  const FoodDetailState({
    required this.foodType,
    required this.items,
    this.isSelectItemDropdownOpen = false,
    this.selectedItem,
  });

  FoodDetailState copyWith({
    FoodType? foodType,
    List<FoodItem>? items,
    bool? isSelectItemDropdownOpen,
    FoodItem? selectedItem,
  }) {
    return FoodDetailState(
      foodType: foodType ?? this.foodType,
      items: items ?? this.items,
      isSelectItemDropdownOpen:
          isSelectItemDropdownOpen ?? this.isSelectItemDropdownOpen,
      selectedItem: selectedItem,
    );
  }

  @override
  List<Object?> get props => [
    foodType,
    items,
    isSelectItemDropdownOpen,
    selectedItem,
  ];
}
