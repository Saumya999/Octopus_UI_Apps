class NewUser {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String error;


  NewUser({ this.id,this.firstName, this.lastName, this.email, this.error});

  factory NewUser.fromJson(Map<String, dynamic> json) {

    if (json['email'] != null) {
      return NewUser(
        id:json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email']
      );
    } else {
      return NewUser(
          error: json['errorMessage']
      );
    }
  }
}


