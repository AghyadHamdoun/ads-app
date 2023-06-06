import '../../postProject/model/type_and_object_model.dart';

class MyAdsModel {
  String? type;
  List<Message>? message;

  MyAdsModel({this.type, this.message});

  MyAdsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  int? id;
  String? title;
  String? description;
  String? location;
  String? amount;
  String? typeId;
  String? objectiveId;
  Null? moreDescribe;
  String? isDeleted;
  String? status;
  PostedBy? postedBy;
  String? bidId;
  String? requestedTo;
  String? requestedToStatus;
  String? createdAt;
  String? updatedAt;
  TypeModel? objective;


  Message(
      {this.id,
        this.title,
        this.description,
        this.location,
        this.amount,
        this.typeId,
        this.objectiveId,
        this.moreDescribe,
        this.isDeleted,
        this.status,
        this.postedBy,
        this.bidId,
        this.requestedTo,
        this.requestedToStatus,
        this.createdAt,
        this.updatedAt,
        this.objective,
  });

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    amount = json['amount'];
    typeId = json['type_id'];
    objectiveId = json['objective_id'];
    moreDescribe = json['more_describe'];
    isDeleted = json['is_deleted'];
    status = json['status'];
    postedBy = json['posted_by'] != null
        ? PostedBy.fromJson(json['posted_by'])
        : null;
    bidId = json['bid_id'];
    requestedTo = json['requested_to'];
    requestedToStatus = json['requested_to_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    objective = json['objective'] != null
        ? TypeModel.fromJson(json['objective'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['location'] = location;
    data['amount'] = amount;
    data['type_id'] = typeId;
    data['objective_id'] = objectiveId;
    data['more_describe'] = moreDescribe;
    data['is_deleted'] = isDeleted;
    data['status'] = status;
    if (postedBy != null) {
      data['posted_by'] = postedBy!.toJson();
    }
    data['bid_id'] = bidId;
    data['requested_to'] = requestedTo;
    data['requested_to_status'] = requestedToStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (objective != null) {
      data['objective'] = objective!.toJson();
    }

    return data;
  }
}

class PostedBy {
  int? id;
  String? firstName;
  String? lastName;
  String? description;
  Null? profilePicture;
  String? email;
  Null? emailVerifiedAt;
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

  PostedBy(
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

  PostedBy.fromJson(Map<String, dynamic> json) {
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

