import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/explore/explore_state.dart";

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit()
    : super(
        ExploreState(
          products: [
            Product(
              name: "Frash Fruit & Vegetables",
              image: "assets/images/frash_fruit.png",
            ),

            Product(
              name: "Cooking Oil & Ghee",
              image: "assets/images/cooking_oil.png",
            ),

            Product(name: "Meat & Fish", image: "assets/images/meat_fish.png"),

            Product(
              name: "Bakery & Snack",
              image: "assets/images/bakery_snacks.png",
            ),

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
          ],
        ),
      );

  void selectedItem(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
