import "package:equatable/equatable.dart";

class FoodType extends Equatable {
  final String name;
  final String image;

  const FoodType({required this.name, required this.image});

  @override
  List<Object?> get props => [name, image];
}

class CartState extends Equatable {
  final List<FoodType> foodTypes;
  final bool isDropdownOpen;
  final int selectedIndex;

  const CartState({
    required this.foodTypes,
    this.isDropdownOpen = false,
    this.selectedIndex = 2,
  });

  CartState copyWith({
    List<FoodType>? foodTypes,
    bool? isDropdownOpen,
    int? selectedIndex,
  }) {
    return CartState(
      foodTypes: foodTypes ?? this.foodTypes,
      isDropdownOpen: isDropdownOpen ?? this.isDropdownOpen,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [foodTypes, isDropdownOpen, selectedIndex];
}
