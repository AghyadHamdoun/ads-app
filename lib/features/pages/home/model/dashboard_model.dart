

class DashboardModel {
  String? type;
  Message? message;

  DashboardModel({this.type, this.message});

  DashboardModel.fromJson(Map<String, dynamic> json) {
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
  String? balance;
  int? totalProjects;
  int? inProgress;
  int? completed;
  int? totalMilestones;
  int? activeMilestones;

  Message(
      {this.balance,
        this.totalProjects,
        this.inProgress,
        this.completed,
        this.totalMilestones,
        this.activeMilestones});

  Message.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    totalProjects = json['totalProjects'];
    inProgress = json['inProgress'];
    completed = json['completed'];
    totalMilestones = json['totalMilestones'];
    activeMilestones = json['activeMilestones'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['totalProjects'] = totalProjects;
    data['inProgress'] = inProgress;
    data['completed'] = completed;
    data['totalMilestones'] = totalMilestones;
    data['activeMilestones'] = activeMilestones;
    return data;
  }
}
