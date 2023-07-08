class NewsModel {
  NewsModel({
      this.status, 
      this.msg, 
      this.data, 
      this.length,});

  NewsModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['DATA'] != null) {
      data = [];
      json['DATA'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    length = json['length'];
  }
  bool? status;
  String? msg;
  List<Data>? data;
  int? length;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['DATA'] = data?.map((v) => v.toJson()).toList();
    }
    map['length'] = length;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.news, 
      this.description, 
      this.enddate, 
      this.date, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    news = json['news'];
    description = json['description'];
    enddate = json['enddate'];
    date = json['date'];
    v = json['__v'];
  }
  String? id;
  String? news;
  String? description;
  String? enddate;
  String? date;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['news'] = news;
    map['description'] = description;
    map['enddate'] = enddate;
    map['date'] = date;
    map['__v'] = v;
    return map;
  }

}