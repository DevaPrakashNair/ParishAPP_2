class ProfileModel {
  ProfileModel({
      this.status, 
      this.msg, 
      this.data, 
      this.familyDetails,});

  ProfileModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    familyDetails = json['familyDetails'] != null ? FamilyDetails.fromJson(json['familyDetails']) : null;
  }
  bool? status;
  String? msg;
  List<Data>? data;
  FamilyDetails? familyDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (familyDetails != null) {
      map['familyDetails'] = familyDetails?.toJson();
    }
    return map;
  }

}

class FamilyDetails {
  FamilyDetails({
      this.id, 
      this.status, 
      this.wardId, 
      this.familyName, 
      this.v, 
      this.noOfMembers,});

  FamilyDetails.fromJson(dynamic json) {
    id = json['_id'];
    status = json['status'];
    wardId = json['wardId'] != null ? WardId.fromJson(json['wardId']) : null;
    familyName = json['familyName'];
    v = json['__v'];
    noOfMembers = json['noOfMembers'];
  }
  String? id;
  String? status;
  WardId? wardId;
  String? familyName;
  int? v;
  int? noOfMembers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['status'] = status;
    if (wardId != null) {
      map['wardId'] = wardId?.toJson();
    }
    map['familyName'] = familyName;
    map['__v'] = v;
    map['noOfMembers'] = noOfMembers;
    return map;
  }

}

class WardId {
  WardId({
      this.id, 
      this.wardname, 
      this.patreon, 
      this.parishId, 
      this.status, 
      this.v,});

  WardId.fromJson(dynamic json) {
    id = json['_id'];
    wardname = json['wardname'];
    patreon = json['patreon'];
    parishId = json['parishId'];
    status = json['status'];
    v = json['__v'];
  }
  String? id;
  String? wardname;
  String? patreon;
  String? parishId;
  String? status;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['wardname'] = wardname;
    map['patreon'] = patreon;
    map['parishId'] = parishId;
    map['status'] = status;
    map['__v'] = v;
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