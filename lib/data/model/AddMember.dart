class AddMember {
  AddMember({
      this.status, 
      this.msg, 
      this.data,});

  AddMember.fromJson(dynamic json) {
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
      this.status, 
      this.isCompleted, 
      this.id, 
      this.name, 
      this.familyId, 
      this.userType, 
      this.dob, 
      this.baptismName, 
      this.phoneNumber, 
      this.emailId, 
      this.gender, 
      this.occupation, 
      this.v,});

  Data.fromJson(dynamic json) {
    status = json['status'];
    isCompleted = json['isCompleted'];
    id = json['_id'];
    name = json['name'];
    familyId = json['familyId'];
    userType = json['userType'];
    dob = json['dob'];
    baptismName = json['baptismName'];
    phoneNumber = json['phoneNumber'];
    emailId = json['emailId'];
    gender = json['gender'];
    occupation = json['occupation'];
    v = json['__v'];
  }
  String? status;
  bool? isCompleted;
  String? id;
  String? name;
  String? familyId;
  String? userType;
  String? dob;
  String? baptismName;
  int? phoneNumber;
  String? emailId;
  String? gender;
  String? occupation;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['isCompleted'] = isCompleted;
    map['_id'] = id;
    map['name'] = name;
    map['familyId'] = familyId;
    map['userType'] = userType;
    map['dob'] = dob;
    map['baptismName'] = baptismName;
    map['phoneNumber'] = phoneNumber;
    map['emailId'] = emailId;
    map['gender'] = gender;
    map['occupation'] = occupation;
    map['__v'] = v;
    return map;
  }

}