import "package:equatable/equatable.dart";

class ProfileFunction extends Equatable {
  final String image;
  final String text;
  final String arrow;

  const ProfileFunction({
    required this.image,
    required this.text,
    required this.arrow,
  });

  @override
  List<Object?> get props => [image, text, arrow];
}

class ProfileState extends Equatable {
  final String name;
  final String email;
  final String image;
  final List<ProfileFunction> infors;
  final int selectedIndex;
  final bool isLoading;
  final bool isLogOutSuccess;

  const ProfileState({
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
      infors: infors ?? this.infors,
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
    infors,
    selectedIndex,
    isLoading,
    isLogOutSuccess,
  ];
}
