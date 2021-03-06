import 'content.dart';

class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  bool? isFeatured;
  late List<String> tags;
  bool? status;
  int? createdByUserId;
  int? updatedByUserId;
  int? featuredContentId;
  // List<Content> featureContent;
  late List<Content> contents;

  Category(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.isFeatured,
      this.tags = const <String>[],
      this.status,
      this.createdByUserId,
      this.updatedByUserId,
      this.featuredContentId,
      // this.featureContent,
      this.contents = const <Content>[]});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    isFeatured = json['is_featured'];
    status = json['status'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    featuredContentId = json['featured_content_id'];
    // if (json['feature_content'] != null) {
    //   featureContent = <Content>[];
    //   json['feature_content'].forEach((v) {
    //     contents!.add(Content.fromJson(v));
    //   });
    // }
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags.add(v);
      });
    }
    if (json['contents'] != null) {
      contents = <Content>[];
      json['contents'].forEach((v) {
        contents.add(Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['is_featured'] = isFeatured;
    data['status'] = status;
    data['created_by_user_id'] = createdByUserId;
    data['updated_by_user_id'] = updatedByUserId;
    data['featured_content_id'] = featuredContentId;
    // if (featureContent != null) {
    //   data['feature_content'] = featureContent!.map((v) => v.toJson()).toList();
    // }
    data['tags'] = tags.map((v) => v).toList();
    data['contents'] = contents.map((v) => v.toJson()).toList();
    return data;
  }
}
