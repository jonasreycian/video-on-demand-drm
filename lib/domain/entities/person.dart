/// Represents a person.
class Person {
  /// The name of the person as a `String`.
  final String? fullName;

  /// The person's cast name as a `String`.
  final String? castName;

  /// The person's image url as a `String`.
  final String? imageUrl;

  /// The person's biography as a `String`.
  final String? biography;

  const Person({
    required this.fullName,
    this.castName,
    this.biography,
    required this.imageUrl,
  });

  Person.from(Person person)
      : fullName = person.fullName,
        castName = person.castName,
        imageUrl = person.imageUrl,
        biography = person.biography;

  Person.fromJson(Map<String, dynamic> map)
      : fullName = map['fullName'] as String,
        castName = map['castName'] as String,
        imageUrl = map['imageUrl'] as String,
        biography = map['biography'] as String;

  /// Convert [this] to a Json `Map<String, dynamic>`. Complex structures keep their initial type.
  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'castName': castName,
        'imageUrl': imageUrl,
        'biography': biography,
      };

  /// Convert [this] to a Json `String`. Complex structures keep their initial type.
  Map<String, dynamic> toJson2() => {
        'fullName': fullName,
        'castName': castName,
        'imageUrl': imageUrl,
        'biography': biography,
      };

  @override
  String toString() {
    return 'Person(fullName: $fullName, castName: $castName, imageUrl: $imageUrl, biography: $biography)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Person &&
            other.fullName == fullName &&
            other.castName == castName &&
            other.imageUrl == imageUrl &&
            other.biography == biography);
  }

  @override
  int get hashCode =>
      fullName.hashCode ^
      castName.hashCode ^
      imageUrl.hashCode ^
      biography.hashCode;
}
