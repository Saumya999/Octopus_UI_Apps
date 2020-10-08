class User {


  final String userId;
  final String firstName;
  final String lastName;
  final String email;

  User({this.userId, this.firstName, this.lastName, this.email});

  factory User.fromJson(Map<String, String> json) {

    return User(
      userId: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email']
      );
  }
}


