class Category {
  final String name;

  Category(this.name);

  Category.from(Category category) : name = category.name;

  Category.fromJson(Map<String, dynamic> map) : name = map['name'] as String;

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
    return 'Category(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Category && other.name == name);
  }

  @override
  int get hashCode => name.hashCode;
}
