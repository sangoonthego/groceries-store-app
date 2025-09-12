import "package:equatable/equatable.dart";

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

class ProfileState extends Equatable {
  final String name;
  final String email;
  final String image;
  final List<ProfileFunction> infors;
  final int selectedIndex;
  final bool isLoading;
  final bool isLogOutSuccess;

  ProfileState({
    required this.name,
    required this.email,
    required this.image,
    required this.infors,
    this.selectedIndex = 4,
    this.isLoading = false,
    this.isLogOutSuccess = false,
  });

  ProfileState copyWith({
    String? name,
    String? email,
    String? image,
    List<ProfileFunction>? infors,
    int? selectedIndex,
    bool? isLoading,
    bool? isLogOutSuccess,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      infors: this.infors, // Infors list is static, no need to copy
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
      isLogOutSuccess: isLogOutSuccess ?? this.isLogOutSuccess,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    image,
    selectedIndex,
    isLoading,
    isLogOutSuccess,
  ];
}
