

class TechJobsModel {
  String? result;
  List<Data>? data;

  TechJobsModel({this.result, this.data});

  TechJobsModel.fromJson(Map<String, dynamic> json) {
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
  String? devname;
  String? job;
  String? tenant;
  String? unitType;
  String? receiptno;
  String? amount;
  String? unitNumber;
  String? empName;
  String? empCode;



  Data(
      {this.devname,
        this.job,
        this.tenant,
        this.unitType,
        this.receiptno,
        this.amount,
        this.unitNumber,
        this.empCode,
        this.empName,
      });

  Data.fromJson(Map<String, dynamic> json) {
    devname = json['devname'];
    job = json['job'];
    tenant = json['tenant'];
    unitType = json['unit_type'];
    receiptno = json['receiptno'];
    amount = json['amount'];
    unitNumber = json['unitNumber'];
    empCode = json['empCode'];
    empName = json['empName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['devname'] = devname;
    data['job'] = job;
    data['tenant'] = tenant;
    data['unit_type'] = unitType;
    data['receiptno'] = receiptno;
    data['amount'] = amount;
    data['unitNumber'] = unitNumber;
    return data;
  }
}
