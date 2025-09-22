class User {
  final String name;
  final String email;
  final String city;
  final String? gender;
  final DateTime birthdate;

  const User({
    required this.name,
    required this.email,
    required this.city,
    required this.gender,
    required this.birthdate,
  });
}