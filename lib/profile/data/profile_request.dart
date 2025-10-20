class ProfileRequest {
  final String name;
  final String email;
  final String image;

  ProfileRequest({
    required this.name,
    required this.email,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "image": image};
  }
}
