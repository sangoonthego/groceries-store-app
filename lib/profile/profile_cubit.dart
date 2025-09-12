import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_store_app/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
    : super(
        ProfileState(
          name: "Tuan Ngoc",
          email: "knkidngoc@gmail.com",
          image: "assets/images/hamster.png",
          infors: [
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
          ],
        ),
      );

  void selectedItem(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void logout() {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(isLoading: false, isLogOutSuccess: true));
    });
  }
}
