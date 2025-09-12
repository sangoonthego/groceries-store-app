import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/explore/explore_state.dart";
import "package:groceries_store_app/home/home_screen.dart";

class ExploreCubit extends Cubit<ExploreState> {
  final List<Product> _products = [
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
  ExploreCubit() : super(ExploreState(products: [])) {
    emit(state.copyWith(products: _products, selectedIndex: 1));
  }

  void selectedItem(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
