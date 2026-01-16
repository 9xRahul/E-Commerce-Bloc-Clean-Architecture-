class CryptoModel {
  String? coin;
  String? wallet;
  String? network;
  CryptoModel({this.coin, this.wallet, this.network});
  CryptoModel.fromJson(Map<String, dynamic> json) {
    coin = json['coin'];
    wallet = json['wallet'];
    network = json['network'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin'] = this.coin;
    data['wallet'] = this.wallet;
    data['network'] = this.network;
    return data;
  }
}
