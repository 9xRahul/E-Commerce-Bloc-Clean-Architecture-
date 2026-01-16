class BankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;
  BankModel({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });
  BankModel.fromJson(Map<String, dynamic> json) {
    cardExpire = json['cardExpire'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    currency = json['currency'];
    iban = json['iban'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardExpire'] = this.cardExpire;
    data['cardNumber'] = this.cardNumber;
    data['cardType'] = this.cardType;
    data['currency'] = this.currency;
    data['iban'] = this.iban;
    return data;
  }
}
