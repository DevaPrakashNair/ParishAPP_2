class LoginModel {
  LoginModel({
      this.status, 
      this.msg,this.token,
      this.data,});

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];

    token = json['token'];
    data = json['DATA'] != null ? Data.fromJson(json['DATA']) : null;
  }
  bool? status;
  String? msg,token;
  Data? data;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['DATA'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.role, 
      this.usertype, 
      this.isAssigned, 
      this.phone, 
      this.phoneVerified, 
      this.emailVerified, 
      this.password, 
      this.ispasswordChanged, 
      this.isprofileUpdated, 
      this.profileCompletionLevel, 
      this.status, 
      this.cartType, 
      this.level, 
      this.accessPath, 
      this.remarks, 
      this.address, 
      this.createDate, 
      this.updateDate, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    role = json['role'];
    usertype = json['usertype'];
    isAssigned = json['isAssigned'];
    phone = json['phone'];
    phoneVerified = json['phoneVerified'];
    emailVerified = json['emailVerified'];
    password = json['password'];
    ispasswordChanged = json['ispasswordChanged'];
    isprofileUpdated = json['isprofileUpdated'];
    profileCompletionLevel = json['profileCompletionLevel'];
    status = json['status'];
    cartType = json['cartType'];
    level = json['level'];
    accessPath = json['accessPath'];
    remarks = json['remarks'];
    if (json['address'] != null) {
      address = [];
      json['address'].forEach((v) {
        address?.add((v));
      });
    }
    createDate = json['create_date'];
    updateDate = json['update_date'];
    v = json['__v'];
  }
  String? id;
  String? role;
  int? usertype;
  bool? isAssigned;
  int? phone;
  bool? phoneVerified;
  bool? emailVerified;
  String? password;
  bool? ispasswordChanged;
  bool? isprofileUpdated;
  int? profileCompletionLevel;
  String? status;
  String? cartType;
  int? level;
  String? accessPath;
  String? remarks;
  List<dynamic>? address;
  String? createDate;
  String? updateDate;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['role'] = role;
    map['usertype'] = usertype;
    map['isAssigned'] = isAssigned;
    map['phone'] = phone;
    map['phoneVerified'] = phoneVerified;
    map['emailVerified'] = emailVerified;
    map['password'] = password;
    map['ispasswordChanged'] = ispasswordChanged;
    map['isprofileUpdated'] = isprofileUpdated;
    map['profileCompletionLevel'] = profileCompletionLevel;
    map['status'] = status;
    map['cartType'] = cartType;
    map['level'] = level;
    map['accessPath'] = accessPath;
    map['remarks'] = remarks;
    if (address != null) {
      map['address'] = address?.map((v) => v.toJson()).toList();
    }
    map['create_date'] = createDate;
    map['update_date'] = updateDate;
    map['__v'] = v;
    return map;
  }

}