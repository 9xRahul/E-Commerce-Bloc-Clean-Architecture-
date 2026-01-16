class BankEntity {
  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  const BankEntity({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });
}
