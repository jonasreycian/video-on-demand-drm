import 'dart:convert';

import 'package:collection/collection.dart';

class Content {
  int? id;
  String? title;
  String? titleModifier;
  String? releasedDate;
  String? mtrcbRating;
  int? age;
  int? seasonsCount;
  String? synopsis;
  String? logo;
  String? type;
  String? coverPreview;
  String? coverPhoto;
  String? coverPhotoMobile;
  String? coverPhotoTablet;
  String? coverPhotoDesktop;
  int? thumbsUpRatingCount;
  int? thumbsDownRatingCount;
  String? cast;
  String? director;
  String? writers;
  String? tags;
  bool? isFeatured;
  bool? status;
  int? createdByUserId;
  int? updatedByUserId;
  int? videoId;

  Content({
    this.id,
    this.title,
    this.titleModifier,
    this.releasedDate,
    this.mtrcbRating,
    this.age,
    this.seasonsCount,
    this.synopsis,
    this.logo,
    this.type,
    this.coverPreview,
    this.coverPhoto,
    this.coverPhotoMobile,
    this.coverPhotoTablet,
    this.coverPhotoDesktop,
    this.thumbsUpRatingCount,
    this.thumbsDownRatingCount,
    this.cast,
    this.director,
    this.writers,
    this.tags,
    this.isFeatured,
    this.status,
    this.createdByUserId,
    this.updatedByUserId,
    this.videoId,
  });

  factory Content.fromMap(Map<String, dynamic> data) {
    return Content(
      id: data['id'] as int?,
      title: data['title'] as String?,
      titleModifier: data['title_modifier'] as String?,
      releasedDate: data['released_date'] as String?,
      mtrcbRating: data['mtrcb_rating'] as String?,
      age: data['age'] as int?,
      seasonsCount: data['seasons_count'] as int?,
      synopsis: data['synopsis'] as String?,
      logo: data['logo'] as String?,
      type: data['type'] as String?,
      coverPreview: data['cover_preview'] as String?,
      coverPhoto: data['cover_photo'] as String?,
      coverPhotoMobile: data['cover_photo_mobile'] as String?,
      coverPhotoTablet: data['cover_photo_tablet'] as String?,
      coverPhotoDesktop: data['cover_photo_desktop'] as String?,
      thumbsUpRatingCount: data['thumbs_up_rating_count'] as int?,
      thumbsDownRatingCount: data['thumbs_down_rating_count'] as int?,
      cast: data['cast'] as String?,
      director: data['director'] as String?,
      writers: data['writers'] as String?,
      tags: data['tags'] as String?,
      isFeatured: data['is_featured'] as bool?,
      status: data['status'] as bool?,
      createdByUserId: data['created_by_user_id'] as int?,
      updatedByUserId: data['updated_by_user_id'] as int?,
      videoId: data['video_id'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'title_modifier': titleModifier,
      'released_date': releasedDate,
      'mtrcb_rating': mtrcbRating,
      'age': age,
      'seasons_count': seasonsCount,
      'synopsis': synopsis,
      'logo': logo,
      'type': type,
      'cover_preview': coverPreview,
      'cover_photo': coverPhoto,
      'cover_photo_mobile': coverPhotoMobile,
      'cover_photo_tablet': coverPhotoTablet,
      'cover_photo_desktop': coverPhotoDesktop,
      'thumbs_up_rating_count': thumbsUpRatingCount,
      'thumbs_down_rating_count': thumbsDownRatingCount,
      'cast': cast,
      'director': director,
      'writers': writers,
      'tags': tags,
      'is_featured': isFeatured,
      'status': status,
      'created_by_user_id': createdByUserId,
      'updated_by_user_id': updatedByUserId,
      'video_id': videoId,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Content].
  factory Content.fromJson(String data) {
    return Content.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Content] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Content) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      titleModifier.hashCode ^
      releasedDate.hashCode ^
      mtrcbRating.hashCode ^
      age.hashCode ^
      seasonsCount.hashCode ^
      synopsis.hashCode ^
      logo.hashCode ^
      type.hashCode ^
      coverPreview.hashCode ^
      coverPhoto.hashCode ^
      coverPhotoMobile.hashCode ^
      coverPhotoTablet.hashCode ^
      coverPhotoDesktop.hashCode ^
      thumbsUpRatingCount.hashCode ^
      thumbsDownRatingCount.hashCode ^
      cast.hashCode ^
      director.hashCode ^
      writers.hashCode ^
      tags.hashCode ^
      isFeatured.hashCode ^
      status.hashCode ^
      createdByUserId.hashCode ^
      updatedByUserId.hashCode ^
      videoId.hashCode;
}
