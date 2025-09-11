import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final String name;
  final String image;
  final double price;
  final String detail;
  final int quantity;
  final int maxQuantity;
  final bool isHeart;

  ProductState({
    required this.name,
    required this.image,
    required this.price,
    required this.detail,
    this.quantity = 1,
    this.maxQuantity = 5,
    this.isHeart = false,
  });

  ProductState copyWith({
    String? name,
    String? image,
    double? price,
    String? detail,
    int? quantity,
    int? maxQuantity,
    bool? isHeart,
  }) {
    return ProductState(
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
