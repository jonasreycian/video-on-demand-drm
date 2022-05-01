class User {
  /// The user's name.
  final String name;

  /// The user's email.
  final String email;

  /// The user's Unique ID.
  final String uid;

  User(this.name, this.email, this.uid);

  User.from(User user)
      : name = user.name,
        email = user.email,
        uid = user.uid;

  /// Convert [this] to a Json `Map<String, dynamic>`. Complex structures keep their initial type.
  User.fromJson(Map<String, dynamic> map)
      : name = map['name'] as String,
        email = map['email'] as String,
        uid = map['uid'] as String;

  /// Convert [this] to a Json `String`. Complex structures keep their initial type.
  Map<String, dynamic> toJson2() => {
        'name': name,
        'email': email,
        'uid': uid,
      };

  @override
  String toString() {
    return 'User(name: $name, email: $email, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is User &&
            other.name == name &&
            other.email == email &&
            other.uid == uid);
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ uid.hashCode;
}
