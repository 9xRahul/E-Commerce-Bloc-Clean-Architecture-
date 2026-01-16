import 'address_entity.dart';

class CompanyEntity {
  final String department;
  final String name;
  final String title;
  final AddressEntity? address;

  const CompanyEntity({
    required this.department,
    required this.name,
    required this.title,
    this.address,
  });
}
