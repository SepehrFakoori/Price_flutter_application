class Currency {
  final String currencyName;
  final int price;

  Currency(this.price, this.currencyName);

  factory Currency.fromMapJson(Map<String, dynamic> jsonMapObject, currencyName) {
    return Currency(jsonMapObject["price"], currencyName);
  }
}