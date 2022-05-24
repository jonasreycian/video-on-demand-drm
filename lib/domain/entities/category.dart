import 'dart:convert';

import 'package:collection/collection.dart';

class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  bool? isFeatured;
  String? tags;
  bool? status;
  int? createdByUserId;
  int? updatedByUserId;
  int? featuredContentId;

  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.isFeatured,
    this.tags,
    this.status,
    this.createdByUserId,
    this.updatedByUserId,
    this.featuredContentId,
  });

  factory Category.fromMap(Map<String, dynamic> data) {
    return Category(
      id: data['id'] as int?,
      name: data['name'] as String?,
      slug: data['slug'] as String?,
      description: data['description'] as String?,
      isFeatured: data['is_featured'] as bool?,
      tags: data['tags'] as String?,
      status: data['status'] as bool?,
      createdByUserId: data['created_by_user_id'] as int?,
      updatedByUserId: data['updated_by_user_id'] as int?,
      featuredContentId: data['featured_content_id'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'is_featured': isFeatured,
      'tags': tags,
      'status': status,
      'created_by_user_id': createdByUserId,
      'updated_by_user_id': updatedByUserId,
      'featured_content_id': featuredContentId,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Category].
  factory Category.fromJson(String data) {
    return Category.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Category] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Category) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ slug.hashCode ^ description.hashCode ^ isFeatured.hashCode ^ tags.hashCode ^ status.hashCode ^ createdByUserId.hashCode ^ updatedByUserId.hashCode ^ featuredContentId.hashCode;
}
