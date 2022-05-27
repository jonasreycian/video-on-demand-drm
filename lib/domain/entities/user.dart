class User {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? birthdate;
  String? image;
  String? email;
  bool? status;
  String? createdAt;
  int? planId;
  String? plainTextToken;
  Plan? plan;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.birthdate,
      this.image,
      this.email,
      this.status,
      this.createdAt,
      this.planId,
      this.plainTextToken,
      this.plan});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    birthdate = json['birthdate'];
    image = json['image'];
    email = json['email'];
    status = json['status'];
    createdAt = json['created_at'];
    planId = json['plan_id'];
    plainTextToken = json['plainTextToken'];
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['birthdate'] = birthdate;
    data['image'] = image;
    data['email'] = email;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['plan_id'] = planId;
    data['plainTextToken'] = plainTextToken;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class Plan {
  int? id;
  String? name;
  String? description;
  List<int>? excludedCatalogs;
  String? priceMonthly;
  String? priceYearly;

  Plan(
      {this.id,
      this.name,
      this.description,
      this.excludedCatalogs,
      this.priceMonthly,
      this.priceYearly});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    excludedCatalogs = json['excluded_catalogs'].cast<int>();
    priceMonthly = json['price_monthly'];
    priceYearly = json['price_yearly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['excluded_catalogs'] = excludedCatalogs;
    data['price_monthly'] = priceMonthly;
    data['price_yearly'] = priceYearly;
    return data;
  }
}
