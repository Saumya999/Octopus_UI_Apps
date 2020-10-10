class User {


  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String error;


  User({this.userId, this.firstName, this.lastName, this.email, this.error});

  factory User.fromJson(Map<String, dynamic> json) {

    if (json['email'] != null) {
      return User(
        userId: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
      );
    } else {
      return User(
        error: json['errorMessage']
      );
    }
  }
}


