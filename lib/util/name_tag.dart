extension CurrencyName on String {
  String get fullName => _currencyNameMap[this] ?? _formatCurrencyLabel(this);

  static final Map<String, String> _currencyNameMap = {
    "usd": "United States Dollar",
    "gbp": "British Pound Sterling",
    "euro": "Euro",
    "gold-miskal": "Gold Miskal",
    "coin-emami": "Coin Emami",
    "coin-baharazadi": "Coin Bahar Azadi",
    "coin-baharazadi-nim": "Coin Bahar Azadi Nim",
    "coin-baharazadi-rob": "Coin Bahar Azadi Rob",
    "coin-gerami": "Coin Gerami",
  };

  String _formatCurrencyLabel(String currency) {
    // Replace hyphens with spaces and capitalize each word
    return currency.split('-').map((word) => _capitalize(word)).join(' ');
  }

  String _capitalize(String word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1);
  }
}
