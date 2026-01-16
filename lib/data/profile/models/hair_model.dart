class HairModel {
  String? color;
  String? type;
  HairModel({this.color, this.type});
  HairModel.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    type = json['type'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['type'] = this.type;
    return data;
  }
}
