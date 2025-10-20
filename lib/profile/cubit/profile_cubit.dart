import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_store_app/profile/cubit/profile_state.dart';
import 'package:groceries_store_app/services/api_service.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiService _apiService;

  ProfileCubit(this._apiService)
    : super(
        ProfileState(
          name: "",
          email: "",
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
              text: "Promo Code",
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

  Future<void> fetchUserProfile() async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await _apiService.getUser();
      final userData =
          response['data'] ??
          response; // để tránh null khi backend không bọc "data"
      final name = userData['username'] ?? userData['name'] ?? 'Unknown';
      final email = userData['email'] ?? 'No email';
      final image =
          userData['avatar'] ??
          userData['image'] ??
          "assets/images/hamster.png";

      emit(
        state.copyWith(
          name: name,
          email: email,
          image: image,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          name: "Error loading profile",
          email: "Please try again later",
        ),
      );
    }
  }

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
