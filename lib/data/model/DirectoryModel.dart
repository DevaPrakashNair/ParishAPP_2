class DirectoryModel {
  bool? status;
  String? msg;
  List<Data>? data;

  DirectoryModel({this.status, this.msg, this.data});

  DirectoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? status;
  String? wardId;
  String? familyName;
  int? iV;
  int? noOfMembers;
  List<Users>? users;

  Data(
      {this.sId,
        this.status,
        this.wardId,
        this.familyName,
        this.iV,
        this.noOfMembers,
        this.users});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    wardId = json['wardId'];
    familyName = json['familyName'];
    iV = json['__v'];
    noOfMembers = json['noOfMembers'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['wardId'] = this.wardId;
    data['familyName'] = this.familyName;
    data['__v'] = this.iV;
    data['noOfMembers'] = this.noOfMembers;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? sId;
  String? status;
  bool? isCompleted;
  String? wardId;
  String? familyId;
  String? name;
  String? gender;
  int? phoneNumber;
  String? userType;
  String? userId;
  int? iV;
  String? baptismName;
  String? dob;
  String? emailId;
  String? occupation;

  Users(
      {this.sId,
        this.status,
        this.isCompleted,
        this.wardId,
        this.familyId,
        this.name,
        this.gender,
        this.phoneNumber,
        this.userType,
        this.userId,
        this.iV,
        this.baptismName,
        this.dob,
        this.emailId,
        this.occupation});

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    isCompleted = json['isCompleted'];
    wardId = json['wardId'];
    familyId = json['familyId'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
    userId = json['userId'];
    iV = json['__v'];
    baptismName = json['baptismName'];
    dob = json['dob'];
    emailId = json['emailId'];
    occupation = json['occupation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['isCompleted'] = this.isCompleted;
    data['wardId'] = this.wardId;
    data['familyId'] = this.familyId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['userType'] = this.userType;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    data['baptismName'] = this.baptismName;
    data['dob'] = this.dob;
    data['emailId'] = this.emailId;
    data['occupation'] = this.occupation;
    return data;
  }
}
