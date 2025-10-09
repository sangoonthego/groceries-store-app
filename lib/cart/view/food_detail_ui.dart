import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_store_app/cart/cubit/cart_state.dart';
import 'package:groceries_store_app/cart/cubit/food_detail_cubit.dart';
import 'package:groceries_store_app/cart/cubit/food_detail_state.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodType foodType;

  const FoodDetailScreen({super.key, required this.foodType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodDetailCubit(initialFoodType: foodType),
      child: const _FoodDetailView(),
    );
  }
}

class _FoodDetailView extends StatelessWidget {
  const _FoodDetailView();
  String _getDetailInfo(String name) {
    switch (name) {
      case "Fruit & Vegetable":
        return "High In Vitamins (Especially Vitamin C And Folate), Dietary Fiber And Various Antioxidants. Support Immune Function, Aid Digestion, And Help Reduce Chronic-Disease Risk. Rich In Fiber, Vitamins A, K, Folate, And Minerals Like Potassium And Magnesium.";
      case "Meat & Fish":
        return "Excellent sources of high-quality protein, essential amino acids, iron, and B vitamins. Crucial for muscle repair, energy production, and cognitive function. Also provides healthy fats like Omega-3.";
      default:
        return "Detailed information about ${name} is coming soon.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDetailCubit, FoodDetailState>(
      builder: (context, state) {
        final cubit = context.read<FoodDetailCubit>();
        final detailInfo = _getDetailInfo(state.foodType.name);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "My Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FoodTypeHeader(foodType: state.foodType),

                const SizedBox(height: 10),

                RichText(
                  text: TextSpan(
                    text: "Detail Information About ",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: state.foodType.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color(0xff53b175),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  detailInfo,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xff888888),
                  ),
                ),
                const SizedBox(height: 30),

                _SelectItemExpansionTile(
                  isOpen: state.isSelectItemDropdownOpen,
                  foodItems: state.items,
                  onTapHeader: cubit.toggleSelectItemDropdown,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FoodTypeHeader extends StatelessWidget {
  final FoodType foodType;

  const _FoodTypeHeader({required this.foodType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xff53b175),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Food Type",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            foodType.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectItemExpansionTile extends StatelessWidget {
  final bool isOpen;
  final List<FoodItem> foodItems;
  final VoidCallback onTapHeader;

  const _SelectItemExpansionTile({
    required this.isOpen,
    required this.foodItems,
    required this.onTapHeader,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff53b175),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTapHeader,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select item",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    isOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          if (isOpen)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: foodItems
                        .map((item) => _FoodItemTile(foodItem: item))
                        .toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _FoodItemTile extends StatelessWidget {
  final FoodItem foodItem;

  const _FoodItemTile({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        children: [
          Image.asset(foodItem.image, width: 40, height: 40),
          const SizedBox(width: 15),

          Expanded(
            child: Text(
              foodItem.name,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),

          const Icon(Icons.add_circle, color: Colors.white),
        ],
      ),
    );
  }
}
