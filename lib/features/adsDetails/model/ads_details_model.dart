class AdsDetailsModel {
  String? type;
  Message? message;
  int? isAlreadyBiddingDone;
  int? conversationCount;

  AdsDetailsModel(
      {this.type,
        this.message,
        this.isAlreadyBiddingDone,
        this.conversationCount});

  AdsDetailsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message =
    json['message'] != null ? Message.fromJson(json['message']) : null;
    isAlreadyBiddingDone = json['isAlreadyBiddingDone'];
    conversationCount = json['conversationCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    data['isAlreadyBiddingDone'] = isAlreadyBiddingDone;
    data['conversationCount'] = conversationCount;
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
  Null? type;
  Objective? objective;
  List<Bids>? bids;

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
        this.type,
        this.objective,
        this.bids,
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
    type = json['type'];
    objective = json['objective'] != null
        ? Objective.fromJson(json['objective'])
        : null;

    if (json['bids'] != null) {
      bids = <Bids>[];
      json['bids'].forEach((v) {
        bids!.add(Bids.fromJson(v));
      });
    }
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
    data['type'] = type;
    if (objective != null) {
      data['objective'] = objective!.toJson();
    }
    if (bids != null) {
      data['bids'] = bids!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostedBy {
  int? id;
  String? firstName;
  String? lastName;
  String? description;
  String? profilePicture;
  String? email;
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

class Objective {
  int? id;
  String? name;
  String? nameAr;
  String? status;
  String? textField;
  String? createdAt;
  String? updatedAt;

  Objective(
      {this.id,
        this.name,
        this.nameAr,
        this.status,
        this.textField,
        this.createdAt,
        this.updatedAt});

  Objective.fromJson(Map<String, dynamic> json) {
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

class Bids {
  int? id;
  String? proposal;
  String? projectId;
  ProposalBy? proposalBy;
  String? amount;
  String? duration;
  String? createdAt;
  String? updatedAt;

  Bids(
      {this.id,
        this.proposal,
        this.projectId,
        this.proposalBy,
        this.amount,
        this.duration,
        this.createdAt,
        this.updatedAt});

  Bids.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    proposal = json['proposal'];
    projectId = json['project_id'];
    proposalBy = json['proposal_by'] != null
        ? ProposalBy.fromJson(json['proposal_by'])
        : null;
    amount = json['amount'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['proposal'] = proposal;
    data['project_id'] = projectId;
    if (proposalBy != null) {
      data['proposal_by'] = proposalBy!.toJson();
    }
    data['amount'] = amount;
    data['duration'] = duration;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProposalBy {
  int? id;
  String? firstName;
  String? lastName;
  String? description;
  String? profilePicture;
  String? email;
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

  ProposalBy(
      {this.id,
        this.firstName,
        this.lastName,
        this.description,
        this.profilePicture,
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
        this.orderNumbers});

  ProposalBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    description = json['description'];
    profilePicture = json['profile_picture'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['description'] = description;
    data['profile_picture'] = profilePicture;
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
