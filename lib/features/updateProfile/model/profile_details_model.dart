


class ProfileDetailsModel {
  String? type;
  Message? message;

  ProfileDetailsModel({this.type, this.message});

  ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message =
    json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (message != null) {
      data['message'] =message!.toJson();
    }
    return data;
  }
}

class Message {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? description;
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

  Message(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.contactNumber,
        this.role,
        this.status,
        this.balance,
        this.verificationCode,
        this.mblConfirmationCode,
        this.createdAt,
        this.updatedAt,
        this.averageRating,
        this.orderNumbers,
        this.description
          });

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
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
    description = json['description'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
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
