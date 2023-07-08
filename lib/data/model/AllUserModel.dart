class AllUserModel {
  AllUserModel({
      this.status, 
      this.msg, 
      this.user,});

  AllUserModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['user'] != null) {
      user = [];
      json['user'].forEach((v) {
        user?.add(User.fromJson(v));
      });
    }
  }
  bool? status;
  String? msg;
  List<User>? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (user != null) {
      map['user'] = user?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.status, 
      this.isCompleted, 
      this.wardId, 
      this.familyId, 
      this.name, 
      this.gender, 
      this.phoneNumber, 
      this.v,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    status = json['status'];
    isCompleted = json['isCompleted'];
    wardId = json['wardId'];
    familyId = json['familyId'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    v = json['__v'];
  }
  String? id;
  String? status;
  bool? isCompleted;
  String? wardId;
  String? familyId;
  String? name;
  String? gender;
  int? phoneNumber;
  int? v;

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
    map['__v'] = v;
    return map;
  }

}