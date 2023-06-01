

class HandoverHistoryModel {
  String? result;
  List<Data>? data;

  HandoverHistoryModel({this.result, this.data});

  HandoverHistoryModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? transactionNumber;
  int? status;
  String? statusName;
  String? collectorName;
  String? techName;
  String? accountantName;
  String? handoverDate;
  String? amount;
  String? jobCount;

  Data(
      {this.transactionNumber,
        this.status,
        this.statusName,
        this.collectorName,
        this.techName,
        this.handoverDate,
        this.amount,
        this.accountantName,
        this.jobCount});

  Data.fromJson(Map<String, dynamic> json) {
    transactionNumber = json['transactionNumber'];
    status = json['status'];
    statusName = json['status_name'];
    collectorName = json['collector_name'];
    handoverDate = json['handoverDate'];
    amount = json['amount'];
    jobCount = json['jobCount'];
    techName= json['techName'];
    accountantName= json['accountantName'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionNumber'] = transactionNumber;
    data['status'] = status;
    data['status_name'] = statusName;
    data['collector_name'] = collectorName;
    data['handoverDate'] = handoverDate;
    data['amount'] = amount;
    data['jobCount'] = jobCount;
    return data;
  }
}
