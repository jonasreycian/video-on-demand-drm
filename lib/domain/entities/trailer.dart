import 'dart:convert';

import 'package:collection/collection.dart';

class Trailer {
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
  int? createdByUserId;
  int? updatedByUserId;

  Trailer({
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
  });

  factory Trailer.fromMap(Map<String, dynamic> data) {
    return Trailer(
      id: data['id'] as int?,
      title: data['title'] as String?,
      runtime: data['runtime'] as int?,
      releasedDate: data['released_date'] as String?,
      description: data['description'] as String?,
      quality: data['quality'] as String?,
      dash: data['dash'] as String?,
      hls: data['hls'] as String?,
      smooth: data['smooth'] as String?,
      progressive: data['progressive'] as String?,
      synopsis: data['synopsis'] as String?,
      status: data['status'] as bool?,
      createdByUserId: data['created_by_user_id'] as int?,
      updatedByUserId: data['updated_by_user_id'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'runtime': runtime,
      'released_date': releasedDate,
      'description': description,
      'quality': quality,
      'dash': dash,
      'hls': hls,
      'smooth': smooth,
      'progressive': progressive,
      'synopsis': synopsis,
      'status': status,
      'created_by_user_id': createdByUserId,
      'updated_by_user_id': updatedByUserId,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Trailer].
  factory Trailer.fromJson(String data) {
    return Trailer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Trailer] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Trailer) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      runtime.hashCode ^
      releasedDate.hashCode ^
      description.hashCode ^
      quality.hashCode ^
      dash.hashCode ^
      hls.hashCode ^
      smooth.hashCode ^
      progressive.hashCode ^
      synopsis.hashCode ^
      status.hashCode ^
      createdByUserId.hashCode ^
      updatedByUserId.hashCode;
}
