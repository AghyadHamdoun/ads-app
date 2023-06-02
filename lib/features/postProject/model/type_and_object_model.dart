

class TypesAndObjectivesModel {
  String? type;
  Message? message;

  TypesAndObjectivesModel({this.type, this.message});

  TypesAndObjectivesModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message =
    json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  List<TypeModel>? type;
  List<TypeModel>? objective;
  List<Influences>? influences;

  Message({this.type, this.objective, this.influences});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['type'] != null) {
      type = <TypeModel>[];
      json['type'].forEach((v) {
        type!.add(TypeModel.fromJson(v));
      });
    }
    if (json['objective'] != null) {
      objective = <TypeModel>[];
      json['objective'].forEach((v) {
        objective!.add(TypeModel.fromJson(v));
      });
    }
    if (json['influences'] != null) {
      influences = <Influences>[];
      json['influences'].forEach((v) {
        influences!.add(Influences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type!.map((v) => v.toJson()).toList();
    }
    if (objective != null) {
      data['objective'] = objective!.map((v) => v.toJson()).toList();
    }
    if (influences != null) {
      data['influences'] = influences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TypeModel {
  int? id;
  String? name;
  String? nameAr;
  String? status;
  String? textField;
  String? createdAt;
  String? updatedAt;

  TypeModel(
      {this.id,
        this.name,
        this.nameAr,
        this.status,
        this.textField,
        this.createdAt,
        this.updatedAt});

  TypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    status = json['status'];
    textField = json['text_field'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['status'] = status;
    data['text_field'] = textField;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Influences {
  int? id;
  String? firstName;
  String? lastName;
  String? description;
  String? profilePicture;
  String? email;
  String? emailVerifiedAt;
  String? contactNumber;
  String? role;
  String? status;
  String? balance;
  String? verificationCode;
  String? mblConfirmationCode;
  String? createdAt;
  String? updatedAt;
  String? averageRating;
  int? orderNumbers;

  Influences(
      {this.id,
        this.firstName,
        this.lastName,
        this.description,
        this.profilePicture,
        this.email,
        this.emailVerifiedAt,
        this.contactNumber,
        this.role,
        this.status,
        this.balance,
        this.verificationCode,
        this.mblConfirmationCode,
        this.createdAt,
        this.updatedAt,
        this.averageRating,
        this.orderNumbers});

  Influences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    description = json['description'];
    profilePicture = json['profile_picture'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    contactNumber = json['contact_number'];
    role = json['role'];
    status = json['status'];
    balance = json['balance'];
    verificationCode = json['verification_code'];
    mblConfirmationCode = json['mbl_confirmation_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    averageRating = json['average_rating'];
    orderNumbers = json['order_numbers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['description'] = description;
    data['profile_picture'] = profilePicture;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['contact_number'] = contactNumber;
    data['role'] = role;
    data['status'] = status;
    data['balance'] = balance;
    data['verification_code'] = verificationCode;
    data['mbl_confirmation_code'] = mblConfirmationCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['average_rating'] = averageRating;
    data['order_numbers'] = orderNumbers;
    return data;
  }
}
