class RegisterData {
  final String? name;
  final String? phone;
  final String? email;
  final int? id;
  final String? image;
  final String? token;

  RegisterData({this.name, this.phone, this.email, this.id, this.image, this.token});

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      token: json['token'] as String?,
    );
  }
}