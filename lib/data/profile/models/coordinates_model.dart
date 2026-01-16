class CoordinatesModel {
  double? lat;
  double? lng;
  CoordinatesModel({this.lat, this.lng});
  CoordinatesModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
