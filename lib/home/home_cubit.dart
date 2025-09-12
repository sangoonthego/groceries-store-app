import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_store_app/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final List<MainProduct> _fruits = [
    MainProduct(
      name: "Organic Bananas",
      mass: "7pcs, Priceg",
      price: "\$4.99",
      image: "assets/images/organic_bananas.png",
    ),
    MainProduct(
      name: "Apple",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/apple2.png",
    ),
    MainProduct(
      name: "Apple",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/apple2.png",
    ),
  ];

  final List<MainProduct> _spices = [
    MainProduct(
      name: "Bell Pepper Red",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/pepper_red.png",
    ),
    MainProduct(
      name: "Ginger",
      mass: "250gr, Priceg",
      price: "\$4.99",
      image: "assets/images/ginger.png",
    ),
    MainProduct(
      name: "Ginger",
      mass: "250gr, Priceg",
      price: "\$4.99",
      image: "assets/images/ginger.png",
    ),
  ];

  final List<MainProduct> _beans = [
    MainProduct(name: "Pulses", image: "assets/images/pulses.png"),
    MainProduct(name: "Rice", image: "assets/images/rice.png"),
    MainProduct(name: "Rice", image: "assets/images/rice.png"),
  ];

  final List<MainProduct> _meats = [
    MainProduct(
      name: "Beef Bone",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/beef_bone.png",
    ),
    MainProduct(
      name: "Broiler Chicken",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/broiler_chicken.png",
    ),
    MainProduct(
      name: "Broiler Chicken",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/broiler_chicken.png",
    ),
  ];

  HomeCubit()
    : super(
        HomeState(
          mainProducts: [],
          fruits: [],
          spices: [],
          beans: [],
          meats: [],
        ),
      ) {
    emit(
      state.copyWith(
        fruits: _fruits,
        spices: _spices,
        beans: _beans,
        meats: _meats,
        mainProducts: _fruits,
        selectedIndex: 0,
      ),
    );
  }
  void selectedItem(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
