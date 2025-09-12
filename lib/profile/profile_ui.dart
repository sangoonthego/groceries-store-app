import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/login/login_ui.dart";
import "package:groceries_store_app/home/home_screen.dart";
import "package:groceries_store_app/explore/explore_ui.dart";
import "package:groceries_store_app/profile/profile_state.dart";
import "package:groceries_store_app/profile/profile_cubit.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.isLogOutSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          return Scaffold(
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
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
                            backgroundImage: AssetImage(state.image),
                          ),
                          title: Row(
                            children: <Widget>[
                              Text(
                                state.name,
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
                            state.email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff888888),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.infors.length,
                          itemBuilder: (context, index) {
                            final infor = state.infors[index];
                            return _buildProfileFunction(infor);
                          },
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          height: 67,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _showLogOutDialog(context, cubit),
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
                if (state.isLoading)
                  Container(
                    color: Colors.white.withValues(),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExploreScreen()),
                    );
                    break;
                  // case 2:
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                  //   break;
                  // case 3:
                  case 4:
                    if (state.isLoading)
                      Container(
                        color: Colors.white.withValues(),
                        child: const Center(child: CircularProgressIndicator()),
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

  Widget _buildProfileFunction(ProfileFunction infor) {
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

  Future _showLogOutDialog(BuildContext context, ProfileCubit cubit) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.help_outline),
          content: Text("Are you want to logout?", textAlign: TextAlign.center),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text("NO"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("YES"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    cubit.logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
