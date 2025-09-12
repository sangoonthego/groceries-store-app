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
      products: products ?? this.products,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, isLoading];
}
