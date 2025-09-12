import "package:equatable/equatable.dart";

class MainProduct {
  final String name;
  final String mass;
  final String price;
  final String image;

  MainProduct({
    required this.name,
    required this.image,
    this.price = "\$4.99",
    this.mass = "",
  });
}

class HomeState extends Equatable {
  final List<MainProduct> mainProducts;
  final List<MainProduct> fruits;
  final List<MainProduct> spices;
  final List<MainProduct> beans;
  final List<MainProduct> meats;
  final int selectedIndex;
  final bool isLoading;

  HomeState({
    required this.mainProducts,
    required this.fruits,
    required this.spices,
    required this.beans,
    required this.meats,
    this.selectedIndex = 0,
    this.isLoading = false,
  });

  HomeState copyWith({
    List<MainProduct>? mainProducts,
    List<MainProduct>? fruits,
    List<MainProduct>? beans,
    List<MainProduct>? meats,
    List<MainProduct>? spices,
    int? selectedIndex,
    bool? isLoading,
  }) {
    return HomeState(
      mainProducts: mainProducts ?? this.mainProducts,
      fruits: fruits ?? this.fruits,
      spices: spices ?? this.spices,
      beans: beans ?? this.beans,
      meats: meats ?? this.meats,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, isLoading];
}
