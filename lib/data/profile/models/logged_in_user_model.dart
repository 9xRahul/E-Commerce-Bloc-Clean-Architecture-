import 'hair_model.dart';
import 'address_model.dart';
import 'bank_model.dart';
import 'company_model.dart';
import 'crypto_model.dart';

class LoggedInUserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;
  HairModel? hair;
  String? ip;
  AddressModel? address;
  String? macAddress;
  String? university;
  BankModel? bank;
  CompanyModel? company;
  String? ein;
  String? ssn;
  String? userAgent;
  CryptoModel? crypto;
  String? role;

  LoggedInUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = (json['height'] as num?)?.toDouble();
    weight = (json['weight'] as num?)?.toDouble();
    eyeColor = json['eyeColor'];
    hair = json['hair'] != null ? HairModel.fromJson(json['hair']) : null;
    ip = json['ip'];
    address = json['address'] != null
        ? AddressModel.fromJson(json['address'])
        : null;
    macAddress = json['macAddress'];
    university = json['university'];
    bank = json['bank'] != null ? BankModel.fromJson(json['bank']) : null;
    company = json['company'] != null
        ? CompanyModel.fromJson(json['company'])
        : null;
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
    crypto = json['crypto'] != null
        ? CryptoModel.fromJson(json['crypto'])
        : null;
    role = json['role'];
  }
}
