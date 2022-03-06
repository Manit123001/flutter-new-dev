class UserApiResponse {
  String name;
  String age;

  UserApiResponse({
    required this.name,
    required this.age,
  });

  factory UserApiResponse.fromMap(Map<dynamic, dynamic> map) {
    return UserApiResponse(
      name: map['name'] ?? '',
      age: map['age'] ?? '',
    );
  }

  

  @override
  String toString() => 'UserApiResponse(name: $name, age: $age)';
}
