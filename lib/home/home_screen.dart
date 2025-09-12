import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/explore/explore_ui.dart";
import "package:groceries_store_app/home/home_cubit.dart";
import "package:groceries_store_app/home/home_state.dart";
import "package:groceries_store_app/login/login_ui.dart";
import "package:groceries_store_app/product_detail/product_detail.dart";
import "package:groceries_store_app/profile/profile_ui.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
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
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          // width: double.infinity,
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Image.asset("assets/images/banner.png"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Exclusive Offer",
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
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 248,
                      // width: 100,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics:
                            const BouncingScrollPhysics(), // avoid conflict
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: state.fruits.length,
                        itemBuilder: (context, index) {
                          final fruit = state.fruits[index];
                          return _buildProduct(context, fruit);
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Best Selling",
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
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 248,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: state.spices.length,
                        itemBuilder: (context, index) {
                          final spice = state.spices[index];
                          return _buildProduct(context, spice);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Groceries",
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
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 105,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.5,
                        ),
                        itemCount: state.beans.length,
                        itemBuilder: (context, index) {
                          final bean = state.beans[index];
                          return _buildBeanProduct(bean, index);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 248,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: state.meats.length,
                        itemBuilder: (context, index) {
                          final meat = state.meats[index];
                          return _buildProduct(context, meat);
                        },
                      ),
                    ),
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
                  // icon: Icon(Icons.person),
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

  Widget _buildBeanProduct(MainProduct mainProduct, int index) {
    List<Color> colors = [
      Color(0xffffdac1),
      Color(0xffb5ead7),
      Color(0xffc7ceea),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors[index % colors.length],
        // border: Border.all(color: Color(0xff888888)),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            // alignment: AlignmentDirectional.topStart,
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

  Widget _buildProduct(BuildContext context, MainProduct mainProduct) {
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
