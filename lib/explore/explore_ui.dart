import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/home/home_screen.dart";
import "package:groceries_store_app/profile/profile_ui.dart";
import "package:groceries_store_app/explore/explore_cubit.dart";
import "package:groceries_store_app/explore/explore_state.dart";

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return BlocProvider(
      create: (_) => ExploreCubit(),
      child: BlocConsumer<ExploreCubit, ExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ExploreCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: AlignmentDirectional.center,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Text(
                      "Find Products",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 221, 218, 218),
                            //border: Border.all(color: Color(0xff888888)),
                          ),
                          child: TextField(
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              labelText: "Search Store",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xff888888),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return _buildProduct(context, product, index);
                      },
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    break;
                  case 1:
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

  Widget _buildProduct(BuildContext context, Product product, int index) {
    List<Color> colors = [
      Color.fromARGB(255, 233, 246, 241),
      Color.fromARGB(255, 244, 230, 222),
      Color.fromARGB(255, 238, 215, 217),
      Color.fromARGB(255, 240, 231, 247),
      Color.fromARGB(255, 251, 251, 237),
      Color.fromARGB(255, 235, 246, 251),
    ];

    List<Color> borderColors = [
      Color.fromARGB(255, 64, 143, 114),
      Color.fromARGB(255, 182, 131, 97),
      Color.fromARGB(255, 159, 76, 83),
      Color.fromARGB(255, 121, 76, 159),
      Color.fromARGB(255, 169, 169, 81),
      Color.fromARGB(255, 75, 135, 158),
    ];

    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        ),
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colors[index % colors.length],
          border: Border.all(color: borderColors[index % borderColors.length]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Image.asset(product.image, fit: BoxFit.contain)),
            Text(
              product.name,
              style: TextStyle(
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
