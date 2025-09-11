import "package:equatable/equatable.dart";

class Product {
  final String name;
  final String image;

  Product({required this.name, required this.image});
}

class ExploreState extends Equatable {
  final List<Product> products;
  final int selectedIndex;
  final bool isLoading;

  List<Product> product = [
    Product(
      name: "Frash Fruit & Vegetables",
      image: "assets/images/frash_fruit.png",
    ),

    Product(name: "Cooking Oil & Ghee", image: "assets/images/cooking_oil.png"),

    Product(name: "Meat & Fish", image: "assets/images/meat_fish.png"),

    Product(name: "Bakery & Snack", image: "assets/images/bakery_snacks.png"),

    Product(name: "Dairy Eggs", image: "assets/images/dairy_eggs.png"),

    Product(name: "Beverages", image: "assets/images/beverages.png"),

    Product(
      name: "Frash Fruit and Vegetables",
      image: "assets/images/frash_fruit.png",
    ),

    Product(
      name: "Frash Fruit and Vegetables",
      image: "assets/images/frash_fruit.png",
    ),
  ];

  ExploreState({
    required this.products,
    this.selectedIndex = 1,
    this.isLoading = false,
  });

  ExploreState copyWith({
    List<Product>? products,
    int? selectedIndex,
    bool? isLoading,
  }) {
    return ExploreState(
      products: this.products,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isLoading];
}
