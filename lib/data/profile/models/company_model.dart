import 'package:clean_architecture_with_bloc/data/profile/models/address_model.dart';

class CompanyModel {
  String? department;
  String? name;
  String? title;
  AddressModel? address;
  CompanyModel({this.department, this.name, this.title, this.address});
  CompanyModel.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    name = json['name'];
    title = json['title'];
    address = json['address'] != null
        ? new AddressModel.fromJson(json['address'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['name'] = this.name;
    data['title'] = this.title;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}
