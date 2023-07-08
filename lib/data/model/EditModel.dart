class EditModel {
  EditModel({
      this.status, 
      this.msg, 
      this.data,});

  EditModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.status, 
      this.isCompleted, 
      this.wardId, 
      this.familyId, 
      this.name, 
      this.gender, 
      this.phoneNumber, 
      this.userType, 
      this.userId, 
      this.v, 
      this.baptismName, 
      this.dob, 
      this.emailId, 
      this.occupation,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    status = json['status'];
    isCompleted = json['isCompleted'];
    wardId = json['wardId'];
    familyId = json['familyId'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
    userId = json['userId'];
    v = json['__v'];
    baptismName = json['baptismName'];
    dob = json['dob'];
    emailId = json['emailId'];
    occupation = json['occupation'];
  }
  String? id;
  String? status;
  bool? isCompleted;
  String? wardId;
  String? familyId;
  String? name;
  String? gender;
  int? phoneNumber;
  String? userType;
  String? userId;
  int? v;
  String? baptismName;
  String? dob;
  String? emailId;
  String? occupation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['status'] = status;
    map['isCompleted'] = isCompleted;
    map['wardId'] = wardId;
    map['familyId'] = familyId;
    map['name'] = name;
    map['gender'] = gender;
    map['phoneNumber'] = phoneNumber;
    map['userType'] = userType;
    map['userId'] = userId;
    map['__v'] = v;
    map['baptismName'] = baptismName;
    map['dob'] = dob;
    map['emailId'] = emailId;
    map['occupation'] = occupation;
    return map;
  }

}