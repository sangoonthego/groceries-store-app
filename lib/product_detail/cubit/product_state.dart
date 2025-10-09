import 'package:equatable/equatable.dart';

// Abstract base class
abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object?> get props => [];
}

class ProductReadyState extends ProductDetailState {
  final String name;
  final String image;
  final double price;
  final String detail;
  final int quantity;
  final int maxQuantity;
  final bool isHeart;

  const ProductReadyState({
    required this.name,
    required this.image,
    required this.price,
    required this.detail,
    this.quantity = 1,
    this.maxQuantity = 5,
    this.isHeart = false,
  });

  ProductReadyState copyWith({
    String? name,
    String? image,
    double? price,
    String? detail,
    int? quantity,
    int? maxQuantity,
    bool? isHeart,
  }) {
    return ProductReadyState(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      detail: detail ?? this.detail,
      quantity: quantity ?? this.quantity,
      maxQuantity: maxQuantity ?? this.maxQuantity,
      isHeart: isHeart ?? this.isHeart,
    );
  }

  @override
  List<Object?> get props => [
    name,
    image,
    price,
    detail,
    quantity,
    maxQuantity,
    isHeart,
  ];
}

class ProductLoadingState extends ProductDetailState {
  const ProductLoadingState();
}

class ProductAddedToBasketSuccess extends ProductDetailState {
  final String productName;

  const ProductAddedToBasketSuccess(this.productName);

  @override
  List<Object?> get props => [productName];
}

class ProductFailureState extends ProductDetailState {
  final String productError;

  const ProductFailureState(this.productError);

  @override
  List<Object?> get props => [productError];
}
