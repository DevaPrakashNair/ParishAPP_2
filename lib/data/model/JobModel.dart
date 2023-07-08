class JobModel {
  JobModel({
      this.status, 
      this.data, 
      this.msg,});

  JobModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
    msg = json['msg'];
  }
  bool? status;
  List<String>? data;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['data'] = data;
    map['msg'] = msg;
    return map;
  }

}