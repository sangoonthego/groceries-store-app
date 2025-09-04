import "package:flutter/material.dart";
import "package:groceries_store_app/login_ui.dart";
import "package:groceries_store_app/home_screen.dart";
import "package:groceries_store_app/explore_ui.dart";

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
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class ProfileFunction {
  final String image;
  final String text;
  final String arrow;

  ProfileFunction({
    required this.image,
    required this.text,
    required this.arrow,
  });
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String my_name = "Sango";
  final String my_email = "knkidngoc@gmail.com";

  final List<ProfileFunction> infors = [
    ProfileFunction(
      image: "assets/images/order.png",
      text: "Orders",
      arrow: "assets/images/right_arrow.png",
    ),

    ProfileFunction(
      image: "assets/images/my_detail.png",
      text: "My Details",
      arrow: "assets/images/right_arrow.png",
    ),

    ProfileFunction(
      image: "assets/images/address.png",
      text: "Delivery Address",
      arrow: "assets/images/right_arrow.png",
    ),

    ProfileFunction(
      image: "assets/images/payment.png",
      text: "Payment Methods",
      arrow: "assets/images/right_arrow.png",
    ),

    ProfileFunction(
      image: "assets/images/promo.png",
      text: "Promo Cord",
      arrow: "assets/images/right_arrow.png",
    ),

    ProfileFunction(
      image: "assets/images/bell.png",
      text: "Notifications",
      arrow: "assets/images/right_arrow.png",
    ),

    ProfileFunction(
      image: "assets/images/help.png",
      text: "Help",
      arrow: "assets/images/right_arrow.png",
    ),

    ProfileFunction(
      image: "assets/images/about.png",
      text: "About",
      arrow: "assets/images/right_arrow.png",
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
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/apple2.png"),
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      my_name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset("assets/images/pencil.png"),
                  ],
                ),
                subtitle: Text(
                  my_email,
                  style: TextStyle(fontSize: 16, color: Color(0xff888888)),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: infors.length,
                itemBuilder: (context, index) {
                  final infor = infors[index];
                  return buildProfileFunction(infor);
                },
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 67,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onLogOutClicked,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff53b175),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                  ),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
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

  int _selectedIndex = 4;

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

  void _onLogOutClicked() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  Widget buildProfileFunction(ProfileFunction infor) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(infor.image, width: 28, height: 28),
          title: Text(
            infor.text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          trailing: Image.asset(infor.arrow, width: 20, height: 20),
          onTap: () => {},
        ),
        Divider(height: 10, color: Color(0xff888888)),
      ],
    );
  }
}
