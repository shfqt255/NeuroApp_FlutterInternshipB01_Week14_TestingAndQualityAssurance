class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],
    );
  }
}
