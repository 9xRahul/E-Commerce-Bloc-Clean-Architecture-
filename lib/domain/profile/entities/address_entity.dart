import 'coordinates_entity.dart';

class AddressEntity {
  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final CoordinatesEntity? coordinates;
  final String country;

  const AddressEntity({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    this.coordinates,
    required this.country,
  });
}
