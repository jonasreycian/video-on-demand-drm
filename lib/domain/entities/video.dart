class Video {
  int? id;
  String? title;
  int? runtime;
  String? releasedDate;
  String? description;
  String? quality;
  String? dash;
  String? hls;
  String? smooth;
  String? progressive;
  String? synopsis;
  bool? status;
  String? coverPreview;
  String? coverPhoto;
  String? coverPhotoMobile;
  String? coverPhotoTablet;
  String? coverPhotoDesktop;
  int? createdByUserId;
  int? updatedByUserId;

  Video({
    this.id,
    this.title,
    this.runtime,
    this.releasedDate,
    this.description,
    this.quality,
    this.dash,
    this.hls,
    this.smooth,
    this.progressive,
    this.synopsis,
    this.status,
    this.createdByUserId,
    this.updatedByUserId,
    this.coverPreview,
    this.coverPhoto,
    this.coverPhotoMobile,
    this.coverPhotoTablet,
    this.coverPhotoDesktop,
  });

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    runtime = json['runtime'];
    releasedDate = json['released_date'];
    description = json['description'];
    quality = json['quality'];
    dash = json['dash'];
    hls = json['hls'];
    smooth = json['smooth'];
    progressive = json['progressive'];
    synopsis = json['synopsis'];
    status = json['status'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    coverPreview = json['cover_preview'];
    coverPhoto = json['cover_photo'];
    coverPhotoMobile = json['cover_photo_mobile'];
    coverPhotoTablet = json['cover_photo_tablet'];
    coverPhotoDesktop = json['cover_photo_desktop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['runtime'] = runtime;
    data['released_date'] = releasedDate;
    data['description'] = description;
    data['quality'] = quality;
    data['dash'] = dash;
    data['hls'] = hls;
    data['smooth'] = smooth;
    data['progressive'] = progressive;
    data['synopsis'] = synopsis;
    data['status'] = status;
    data['cover_preview'] = coverPreview;
    data['cover_photo'] = coverPhoto;
    data['cover_photo_mobile'] = coverPhotoMobile;
    data['cover_photo_tablet'] = coverPhotoTablet;
    data['cover_photo_desktop'] = coverPhotoDesktop;
    data['created_by_user_id'] = createdByUserId;
    data['updated_by_user_id'] = updatedByUserId;
    return data;
  }
}
