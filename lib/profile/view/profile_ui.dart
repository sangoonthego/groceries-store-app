import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:groceries_store_app/login/view/login_ui.dart";
import "package:groceries_store_app/home/view/home_screen.dart";
import "package:groceries_store_app/explore/view/explore_ui.dart";
import "package:groceries_store_app/cart/view/cart_ui.dart";
import "package:groceries_store_app/profile/cubit/profile_state.dart";
import "package:groceries_store_app/profile/cubit/profile_cubit.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.isLogOutSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (Route<dynamic> route) => false,
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

                        _ProfileHeader(state: state),
                        const SizedBox(height: 10),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.infors.length,
                          itemBuilder: (context, index) {
                            return ProfileFunctionItem(
                              infor: state.infors[index],
                            );
                          },
                        ),
                        const SizedBox(height: 40),

                        LogOutButton(cubit: cubit),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),

                if (state.isLoading)
                  Container(
                    color: Colors.white.withOpacity(
                      0.5,
                    ), // Sử dụng withOpacity thay vì withValues()
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExploreScreen(),
                      ),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
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

class _ProfileHeader extends StatelessWidget {
  final ProfileState state;

  const _ProfileHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(state.image),
      ),
      title: Row(
        children: <Widget>[
          Text(
            state.name,
            style: const TextStyle(
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
        style: const TextStyle(fontSize: 16, color: Color(0xff888888)),
      ),
    );
  }
}

class ProfileFunctionItem extends StatelessWidget {
  final ProfileFunction infor;

  const ProfileFunctionItem({super.key, required this.infor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(infor.image, width: 28, height: 28),
          title: Text(
            infor.text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          trailing: Image.asset(infor.arrow, width: 20, height: 20),
          onTap: () {},
        ),
        const Divider(height: 10, color: Color(0xff888888)),
      ],
    );
  }
}

class LogOutButton extends StatelessWidget {
  final ProfileCubit cubit;

  const LogOutButton({super.key, required this.cubit});

  Future<void> _showLogOutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.help_outline),
          content: const Text(
            "Are you sure you want to log out?",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng dialog
                  },
                  child: const Text("NO"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng dialog
                    cubit.logout(); // Kích hoạt sự kiện đăng xuất trong Cubit
                  },
                  child: const Text("YES"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 67,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _showLogOutDialog(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff53b175),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          "Log Out",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
