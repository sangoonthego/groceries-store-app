// File: explore_ui.dart

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/home/view/home_screen.dart";
import "package:groceries_store_app/profile/view/profile_ui.dart";
import "package:groceries_store_app/cart/view/cart_ui.dart";
import "package:groceries_store_app/explore/cubit/explore_cubit.dart";
import "package:groceries_store_app/explore/cubit/explore_state.dart";

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExploreCubit(),
      child: BlocConsumer<ExploreCubit, ExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ExploreCubit>();
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      const Text(
                        "Find Products",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),

                      _ExploreSearchBar(),
                      const SizedBox(height: 20),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.9,
                            ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return ExploreCategoryCard(
                            product: product,
                            index: index,
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: state.selectedIndex,
              selectedItemColor: const Color(0xff53b175),
              unselectedItemColor: Colors.black,
              onTap: (index) {
                cubit.selectedItem(index);
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                    break;
                  case 1:
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favourite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Account",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ExploreSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 221, 218, 218),
      ),
      child: const TextField(
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: "Search Store",
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xff888888),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class ExploreCategoryCard extends StatelessWidget {
  final Product product;
  final int index;

  const ExploreCategoryCard({
    super.key,
    required this.product,
    required this.index,
  });

  static const List<Color> _colors = [
    Color.fromARGB(255, 233, 246, 241),
    Color.fromARGB(255, 244, 230, 222),
    Color.fromARGB(255, 238, 215, 217),
    Color.fromARGB(255, 240, 231, 247),
    Color.fromARGB(255, 251, 251, 237),
    Color.fromARGB(255, 235, 246, 251),
  ];

  static const List<Color> _borderColors = [
    Color.fromARGB(255, 64, 143, 114),
    Color.fromARGB(255, 182, 131, 97),
    Color.fromARGB(255, 159, 76, 83),
    Color.fromARGB(255, 121, 76, 159),
    Color.fromARGB(255, 169, 169, 81),
    Color.fromARGB(255, 75, 135, 158),
  ];

  @override
  Widget build(BuildContext context) {
    final int colorIndex = index % _colors.length;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _colors[colorIndex],
          border: Border.all(color: _borderColors[colorIndex], width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Image.asset(product.image, fit: BoxFit.contain)),
            const SizedBox(height: 10),
            Text(
              product.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
