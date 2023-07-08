class WardModel {
  bool? status;
  String? msg;
  List<User>? user;

  WardModel({this.status, this.msg, this.user});

  WardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['status'] = this.status;
    user['msg'] = this.msg;
    if (this.user != null) {
      user['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return user;
  }
}

class User {
  String? sId;
  String? wardname;
  String? patreon;
  String? parishId;
  String? status;
  int? iV;

  User(
      {this.sId,
      this.wardname,
      this.patreon,
      this.parishId,
      this.status,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    wardname = json['wardname'];
    patreon = json['patreon'];
    parishId = json['parishId'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['_id'] = this.sId;
    user['wardname'] = this.wardname;
    user['patreon'] = this.patreon;
    user['parishId'] = this.parishId;
    user['status'] = this.status;
    user['__v'] = this.iV;
    return user;
  }
}
