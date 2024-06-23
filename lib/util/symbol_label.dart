extension CurrencyLabel on String {
  String get formattedCurrencyLabel => _formatCurrencyLabel(this);

  String _formatCurrencyLabel(String currency) {
    return currency.replaceAll('-', ' ');
  }
}
