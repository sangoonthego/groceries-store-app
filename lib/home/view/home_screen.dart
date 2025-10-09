// File: home_screen.dart

import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/explore/view/explore_ui.dart";
import "package:groceries_store_app/home/cubit/home_cubit.dart";
import "package:groceries_store_app/cart/view/cart_ui.dart";
import "package:groceries_store_app/home/cubit/home_state.dart";
import "package:groceries_store_app/profile/view/profile_ui.dart";
import "package:groceries_store_app/product_detail/view/product_detail.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: AlignmentDirectional.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Image.asset("assets/images/carrot.png", width: 35),
                    const SizedBox(height: 5),
                    Image.asset("assets/images/location.png"),
                    const SizedBox(height: 20),
                    // Khu vực tìm kiếm
                    _buildSearchBar(),
                    const SizedBox(height: 15),
                    Image.asset("assets/images/banner.png"),
                    // Exclusive Offer
                    _buildSectionHeader("Exclusive Offer"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 248,
                      child: _ProductHorizontalListView(products: state.fruits),
                    ),
                    const SizedBox(height: 15),
                    // Best Selling
                    _buildSectionHeader("Best Selling"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 248,
                      child: _ProductHorizontalListView(products: state.spices),
                    ),
                    const SizedBox(height: 10),

                    _buildSectionHeader("Groceries"),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 105,
                      child: _BeanProductHorizontalListView(
                        products: state.beans,
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      height: 248,
                      child: _ProductHorizontalListView(products: state.meats),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: state.selectedIndex,
              selectedItemColor: Color(0xff53b175),
              unselectedItemColor: Colors.black,
              onTap: (index) {
                cubit.selectedItem(index);
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExploreScreen()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                    break;
                }
              },
              items: [
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

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff888888)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: "Search Store",
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xff888888),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Text(
            "See all",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xff53B175),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductHorizontalListView extends StatelessWidget {
  final List<MainProduct> products;

  const _ProductHorizontalListView({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1.4,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return StandardProductCard(mainProduct: products[index]);
      },
    );
  }
}

class _BeanProductHorizontalListView extends StatelessWidget {
  final List<MainProduct> products;

  const _BeanProductHorizontalListView({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.5,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return BeanProductCard(mainProduct: products[index], index: index);
      },
    );
  }
}

class StandardProductCard extends StatelessWidget {
  final MainProduct mainProduct;

  const StandardProductCard({super.key, required this.mainProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xff888888)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(),
                  ),
                ),
              },
              child: Center(
                child: Image.asset(mainProduct.image, fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              mainProduct.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              mainProduct.mass,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xff888888),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  mainProduct.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff53B175),
                    border: Border.all(color: Color(0xff53B175)),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BeanProductCard extends StatelessWidget {
  final MainProduct mainProduct;
  final int index;

  const BeanProductCard({
    super.key,
    required this.mainProduct,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color(0xffffdac1),
      Color(0xffb5ead7),
      Color(0xffc7ceea),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors[index % colors.length],
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Image.asset(mainProduct.image, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              mainProduct.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
