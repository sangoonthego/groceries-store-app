import "package:flutter/material.dart";
import "package:groceries_store_app/home_screen.dart";
import "package:groceries_store_app/profile_ui.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExploreScreen(),
    );
  }
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class Product {
  final String name;
  final String image;

  Product({required this.name, required this.image});
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Product> products = [
    Product(
      name: "Frash Fruit & Vegetables",
      image: "assets/images/frash_fruit.png",
    ),

    Product(name: "Cooking Oil & Ghee", image: "assets/images/cooking_oil.png"),

    Product(name: "Meat & Fish", image: "assets/images/meat_fish.png"),

    Product(name: "Bakery & Snack", image: "assets/images/bakery_snacks.png"),

    Product(name: "Dairy Eggs", image: "assets/images/dairy_eggs.png"),

    Product(name: "Beverages", image: "assets/images/beverages.png"),

    Product(
      name: "Frash Fruit and Vegetables",
      image: "assets/images/frash_fruit.png",
    ),

    Product(
      name: "Frash Fruit and Vegetables",
      image: "assets/images/frash_fruit.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
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
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return buildProduct(product, index);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff53b175),
        unselectedItemColor: Colors.black,
        onTap: _onItemBarClicked,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(onPressed: _onShopClicked, icon: Icon(Icons.shop)),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: _onExplorelicked,
              icon: Icon(Icons.explore),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: null, icon: Icon(Icons.shopping_cart)),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: null, icon: Icon(Icons.favorite)),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.person),
            icon: IconButton(
              onPressed: _onAccountClicked,
              icon: Icon(Icons.person),
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }

  int _selectedIndex = 0;

  void _onShopClicked() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  void _onExplorelicked() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExploreScreen()),
      );
    });
  }

  // void _onCartClicked() {
  //   setState(() {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => ProfileScreen()),
  //     );
  //   });
  // }

  // void _onFavouriteClicked() {
  //   setState(() {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => ProfileScreen()),
  //     );
  //   });
  // }

  void _onAccountClicked() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    });
  }

  void _onItemBarClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildProduct(Product product, int index) {
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
