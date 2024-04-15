class LessonModel {
  String? requestid;
  List<Items>? items;
  int? count;
  String? anykey;

  LessonModel({this.requestid, this.items, this.count, this.anykey});

  LessonModel.fromJson(Map<String, dynamic> json) {
    requestid = json['requestid'];
    if (json['items'] != null) {
      items = <Items>[];
      print('-----fromjson lessonmodel');
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    count = json['count'];
    anykey = json['anykey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request id'] = this.requestid;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
      print('......tojson lessonmodel');
    }
    data['count'] = this.count;
    data['anykey'] = this.anykey;
    return data;
  }
}

class Items {
  String? createdAt;
  String? name;
  int? duration;
  String? category;
  bool? locked;
  String? id;

  Items(
      {this.createdAt,
      this.name,
      this.duration,
      this.category,
      this.locked,
      this.id});

  Items.fromJson(Map<String, dynamic> json) {
    print('-----fromjson items class ');
    createdAt = json['createdAt'];
    name = json['name'];
    duration = json['duration'];
    category = json['category'];
    locked = json['locked'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['category'] = this.category;
    data['locked'] = this.locked;
    data['id'] = this.id;
    return data;
  }
}
