  class WithoutLoginModel {
  WithoutLoginModel({
      this.status, 
      this.msg, 
      this.user,});

  WithoutLoginModel.fromJson(dynamic json) {
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
      this.parishAddress, 
      this.id, 
      this.parishName, 
      this.phone, 
      this.email, 
      this.diocese, 
      this.patreon, 
      this.forane, 
      this.createDate, 
      this.updateDate, 
      this.v, 
      this.parishHistory,});

  User.fromJson(dynamic json) {
    parishAddress = json['parishAddress'] != null ? ParishAddress.fromJson(json['parishAddress']) : null;
    id = json['_id'];
    parishName = json['parishName'];
    phone = json['phone'];
    email = json['email'];
    diocese = json['diocese'];
    patreon = json['patreon'] != null ? json['patreon'].cast<String>() : [];
    forane = json['forane'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    v = json['__v'];
    parishHistory = json['parishHistory'];
  }
  ParishAddress? parishAddress;
  String? id;
  String? parishName;
  int? phone;
  String? email;
  String? diocese;
  List<String>? patreon;
  String? forane;
  String? createDate;
  String? updateDate;
  int? v;
  String? parishHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (parishAddress != null) {
      map['parishAddress'] = parishAddress?.toJson();
    }
    map['_id'] = id;
    map['parishName'] = parishName;
    map['phone'] = phone;
    map['email'] = email;
    map['diocese'] = diocese;
    map['patreon'] = patreon;
    map['forane'] = forane;
    map['create_date'] = createDate;
    map['update_date'] = updateDate;
    map['__v'] = v;
    map['parishHistory'] = parishHistory;
    return map;
  }

}

class ParishAddress {
  ParishAddress({
      this.country, 
      this.state, 
      this.district, 
      this.pincode, 
      this.streetAddress, 
      this.locality, 
      this.city,});

  ParishAddress.fromJson(dynamic json) {
    country = json['country'];
    state = json['state'];
    district = json['district'];
    pincode = json['pincode'];
    streetAddress = json['streetAddress'];
    locality = json['locality'];
    city = json['city'];
  }
  String? country;
  String? state;
  String? district;
  int? pincode;
  String? streetAddress;
  String? locality;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['state'] = state;
    map['district'] = district;
    map['pincode'] = pincode;
    map['streetAddress'] = streetAddress;
    map['locality'] = locality;
    map['city'] = city;
    return map;
  }

}