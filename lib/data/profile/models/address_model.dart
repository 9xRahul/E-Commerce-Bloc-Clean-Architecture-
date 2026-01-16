import 'package:clean_architecture_with_bloc/data/profile/models/coordinates_model.dart';

class AddressModel {
  String? address;
  String? city;
  String? state;
  String? stateCode;
  String? postalCode;
  CoordinatesModel? coordinates;
  String? country;
  AddressModel({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });
  AddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
    stateCode = json['stateCode'];
    postalCode = json['postalCode'];
    coordinates = json['coordinates'] != null
        ? new CoordinatesModel.fromJson(json['coordinates'])
        : null;
    country = json['country'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['stateCode'] = this.stateCode;
    data['postalCode'] = this.postalCode;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['country'] = this.country;
    return data;
  }
}
