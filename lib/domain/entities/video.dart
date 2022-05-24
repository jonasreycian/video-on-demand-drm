import 'dart:convert';

import 'package:collection/collection.dart';

class Video {
  int? id;
  String? name;
  String? slug;
  String? description;
  bool? isFeatured;
  String? tags;
  bool? status;
  int? featuredContentId;

  Video({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.isFeatured,
    this.tags,
    this.status,
    this.featuredContentId,
  });

  @override
  String toString() {
    return 'Video(id: $id, name: $name, slug: $slug, description: $description, isFeatured: $isFeatured, tags: $tags, status: $status, featuredContentId: $featuredContentId)';
  }

  factory Video.fromMap(Map<String, dynamic> data) => Video(
        id: data['id'] as int?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        description: data['description'] as String?,
        isFeatured: data['is_featured'] as bool?,
        tags: data['tags'] as String?,
        status: data['status'] as bool?,
        featuredContentId: data['featured_content_id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'description': description,
        'is_featured': isFeatured,
        'tags': tags,
        'status': status,
        'featured_content_id': featuredContentId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Video].
  factory Video.fromJson(String data) {
    return Video.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Video] to a JSON string.
  String toJson() => json.encode(toMap());

  Video copyWith({
    int? id,
    String? name,
    String? slug,
    String? description,
    bool? isFeatured,
    String? tags,
    bool? status,
    int? featuredContentId,
  }) {
    return Video(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      isFeatured: isFeatured ?? this.isFeatured,
      tags: tags ?? this.tags,
      status: status ?? this.status,
      featuredContentId: featuredContentId ?? this.featuredContentId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Video) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      slug.hashCode ^
      description.hashCode ^
      isFeatured.hashCode ^
      tags.hashCode ^
      status.hashCode ^
      featuredContentId.hashCode;
}
