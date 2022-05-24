class Trailer {
  int? id;
  String? title;
  String? description;
  bool? status;
  int? createdByUserId;
  int? updatedByUserId;

  Trailer(
      {this.id,
      this.title,
      this.description,
      this.status,
      this.createdByUserId,
      this.updatedByUserId});

  Trailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['created_by_user_id'] = createdByUserId;
    data['updated_by_user_id'] = updatedByUserId;
    return data;
  }
}
