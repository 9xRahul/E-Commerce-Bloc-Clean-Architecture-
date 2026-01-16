import 'package:clean_architecture_with_bloc/domain/profile/entities/address_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/bank_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/company_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/crypto_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/hair_entity.dart';

class LoggedInUserEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final double height;
  final double weight;
  final String eyeColor;
  final HairEntity? hair;
  final String ip;
  final AddressEntity? address;
  final String macAddress;
  final String university;
  final BankEntity? bank;
  final CompanyEntity? company;
  final String ein;
  final String ssn;
  final String userAgent;
  final CryptoEntity? crypto;
  final String role;

  const LoggedInUserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    this.hair,
    required this.ip,
    this.address,
    required this.macAddress,
    required this.university,
    this.bank,
    this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    this.crypto,
    required this.role,
  });
}
