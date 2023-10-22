class Notif {
  int? id;
  bool? isPaid;
  String? createdAt;
  int? user;
  int? order;

  Notif({this.id, this.isPaid, this.createdAt, this.user, this.order});

  Notif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isPaid = json['is_paid'];
    createdAt = json['created_at'];
    user = json['user'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['is_paid'] = isPaid;
    data['created_at'] = createdAt;
    data['user'] = user;
    data['order'] = order;
    return data;
  }
}
