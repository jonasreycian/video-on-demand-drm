import 'package:aq_prime/domain/entities/video.dart';

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
  Video? video;
  List<Video>? trailers;

  Content(
      {this.id,
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
      this.video,
      this.trailers});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleModifier = json['title_modifier'];
    releasedDate = json['released_date'];
    mtrcbRating = json['mtrcb_rating'];
    age = json['age'];
    seasonsCount = json['seasons_count'];
    synopsis = json['synopsis'];
    logo = json['logo'];
    type = json['type'];
    coverPreview = json['cover_preview'];
    coverPhoto = json['cover_photo'];
    coverPhotoMobile = json['cover_photo_mobile'];
    coverPhotoTablet = json['cover_photo_tablet'];
    coverPhotoDesktop = json['cover_photo_desktop'];
    thumbsUpRatingCount = json['thumbs_up_rating_count'];
    thumbsDownRatingCount = json['thumbs_down_rating_count'];
    cast = json['cast'];
    director = json['director'];
    writers = json['writers'];
    tags = json['tags'];
    isFeatured = json['is_featured'];
    status = json['status'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    videoId = json['video_id'];
    video = json['video'] != null ? Video.fromJson(json['video']) : null;
    if (json['trailers'] != null) {
      trailers = <Video>[];
      json['trailers'].forEach((v) {
        trailers!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_modifier'] = titleModifier;
    data['released_date'] = releasedDate;
    data['mtrcb_rating'] = mtrcbRating;
    data['age'] = age;
    data['seasons_count'] = seasonsCount;
    data['synopsis'] = synopsis;
    data['logo'] = logo;
    data['type'] = type;
    data['cover_preview'] = coverPreview;
    data['cover_photo'] = coverPhoto;
    data['cover_photo_mobile'] = coverPhotoMobile;
    data['cover_photo_tablet'] = coverPhotoTablet;
    data['cover_photo_desktop'] = coverPhotoDesktop;
    data['thumbs_up_rating_count'] = thumbsUpRatingCount;
    data['thumbs_down_rating_count'] = thumbsDownRatingCount;
    data['cast'] = cast;
    data['director'] = director;
    data['writers'] = writers;
    data['tags'] = tags;
    data['is_featured'] = isFeatured;
    data['status'] = status;
    data['created_by_user_id'] = createdByUserId;
    data['updated_by_user_id'] = updatedByUserId;
    data['video_id'] = videoId;
    if (video != null) {
      data['video'] = video!.toJson();
    }
    if (trailers != null) {
      data['trailers'] = trailers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
