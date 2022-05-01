class Subcategory {
  final String name;

  Subcategory(this.name);

  Subcategory.from(Subcategory subcategory) : name = subcategory.name;

  Subcategory.fromJson(Map<String, dynamic> map) : name = map['name'] as String;

  // Convert [this] to a Json `Map<String, dynamic>`. Complex structures keep their initial type.
  Map<String, dynamic> toJson() => {
        'name': name,
      };

  // Convert [this] to a Json `String`. Complex structures keep their initial type.
  Map<String, dynamic> toJson2() => {
        'name': name,
      };

  @override
  String toString() {
    return 'Subcategory(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Subcategory && other.name == name);
  }

  @override
  int get hashCode => name.hashCode;
}
