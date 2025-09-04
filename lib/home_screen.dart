import 'package:flutter/material.dart';
import "package:groceries_store_app/explore_ui.dart";
import "package:groceries_store_app/login_ui.dart";
import "package:groceries_store_app/product_detail.dart";
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Product {
  final String name;
  final String mass;
  final String price;
  final String image;

  Product({
    required this.name,
    required this.mass,
    required this.price,
    required this.image,
  });
}

class BeanProduct {
  final String name;
  final String image;

  BeanProduct({required this.name, required this.image});
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> fruits = [
    Product(
      name: "Organic Bananas",
      mass: "7pcs, Priceg",
      price: "\$4.99",
      image: "assets/images/organic_bananas.png",
    ),

    Product(
      name: "Apple",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/apple2.png",
    ),

    Product(
      name: "Apple",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/apple2.png",
    ),
  ];

  final List<Product> spices = [
    Product(
      name: "Bell Pepper Red",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/pepper_red.png",
    ),

    Product(
      name: "Ginger",
      mass: "250gr, Priceg",
      price: "\$4.99",
      image: "assets/images/ginger.png",
    ),

    Product(
      name: "Ginger",
      mass: "250gr, Priceg",
      price: "\$4.99",
      image: "assets/images/ginger.png",
    ),
  ];

  final List<BeanProduct> beans = [
    BeanProduct(name: "Pulses", image: "assets/images/pulses.png"),
    BeanProduct(name: "Rice", image: "assets/images/rice.png"),
    BeanProduct(name: "Rice", image: "assets/images/rice.png"),
  ];

  final List<Product> meats = [
    Product(
      name: "Beef Bone",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/beef_bone.png",
    ),

    Product(
      name: "Broiler Chicken",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/broiler_chicken.png",
    ),

    Product(
      name: "Broiler Chicken",
      mass: "1kg, Priceg",
      price: "\$4.99",
      image: "assets/images/broiler_chicken.png",
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
                  physics: const BouncingScrollPhysics(), // avoid conflict
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: fruits.length,
                  itemBuilder: (context, index) {
                    final fruit = fruits[index];
                    return buildProduct(fruit);
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
                  itemCount: spices.length,
                  itemBuilder: (context, index) {
                    final spice = spices[index];
                    return buildProduct(spice);
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
                  itemCount: beans.length,
                  itemBuilder: (context, index) {
                    final bean = beans[index];
                    return buildBeanProduct(bean, index);
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
                  itemCount: meats.length,
                  itemBuilder: (context, index) {
                    final meat = meats[index];
                    return buildProduct(meat);
                  },
                ),
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

  Widget buildBeanProduct(BeanProduct beanProduct, int index) {
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
              child: Image.asset(beanProduct.image, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              beanProduct.name,
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

  Widget buildProduct(Product product) {
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
                  MaterialPageRoute(builder: (context) => ProductDetail()),
                ),
              },
              child: Center(
                child: Image.asset(product.image, fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              product.name,
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
              product.mass,
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
                  product.price,
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
