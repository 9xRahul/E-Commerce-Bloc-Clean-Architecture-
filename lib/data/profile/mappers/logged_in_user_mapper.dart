

import 'package:clean_architecture_with_bloc/domain/profile/entities/address_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/bank_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/company_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/coordinates_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/crypto_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/hair_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/logged_in_user_entity.dart';

import '../models/logged_in_user_model.dart';

class LoggedInUserMapper {
  static LoggedInUserEntity toEntity(LoggedInUserModel model) {
    return LoggedInUserEntity(
      id: model.id ?? 0,
      firstName: model.firstName ?? '',
      lastName: model.lastName ?? '',
      maidenName: model.maidenName ?? '',
      age: model.age ?? 0,
      gender: model.gender ?? '',
      email: model.email ?? '',
      phone: model.phone ?? '',
      username: model.username ?? '',
      birthDate: model.birthDate ?? '',
      image: model.image ?? '',
      bloodGroup: model.bloodGroup ?? '',
      height: model.height ?? 0,
      weight: model.weight ?? 0,
      eyeColor: model.eyeColor ?? '',
      hair: model.hair == null
          ? null
          : HairEntity(
              color: model.hair!.color ?? '',
              type: model.hair!.type ?? '',
            ),
      ip: model.ip ?? '',
      address: model.address == null
          ? null
          : AddressEntity(
              address: model.address!.address ?? '',
              city: model.address!.city ?? '',
              state: model.address!.state ?? '',
              stateCode: model.address!.stateCode ?? '',
              postalCode: model.address!.postalCode ?? '',
              coordinates: model.address!.coordinates == null
                  ? null
                  : CoordinatesEntity(
                      lat: model.address!.coordinates!.lat ?? 0,
                      lng: model.address!.coordinates!.lng ?? 0,
                    ),
              country: model.address!.country ?? '',
            ),
      macAddress: model.macAddress ?? '',
      university: model.university ?? '',
      bank: model.bank == null
          ? null
          : BankEntity(
              cardExpire: model.bank!.cardExpire ?? '',
              cardNumber: model.bank!.cardNumber ?? '',
              cardType: model.bank!.cardType ?? '',
              currency: model.bank!.currency ?? '',
              iban: model.bank!.iban ?? '',
            ),
      company: model.company == null
          ? null
          : CompanyEntity(
              department: model.company!.department ?? '',
              name: model.company!.name ?? '',
              title: model.company!.title ?? '',
              address: null,
            ),
      ein: model.ein ?? '',
      ssn: model.ssn ?? '',
      userAgent: model.userAgent ?? '',
      crypto: model.crypto == null
          ? null
          : CryptoEntity(
              coin: model.crypto!.coin ?? '',
              wallet: model.crypto!.wallet ?? '',
              network: model.crypto!.network ?? '',
            ),
      role: model.role ?? '',
    );
  }
}
