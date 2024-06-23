extension PriceLabel on int {
  String get withPriceLabel => _formatPrice(this);

  String _formatPrice(int price) {
    // Convert the price to a string
    String priceString = (price ~/ 10).toString();

    // Split the string into parts before and after the decimal point
    List<String> parts = priceString.split('.');

    // Add commas for thousands separation in the integer part
    String integerPart = parts[0];
    String formattedIntegerPart = '';
    int count = 0;
    for (int i = integerPart.length - 1; i >= 0; i--) {
      if (count % 3 == 0 && count != 0) {
        formattedIntegerPart = ',$formattedIntegerPart';
      }
      formattedIntegerPart = integerPart[i] + formattedIntegerPart;
      count++;
    }

    // If there's a decimal part, append it
    String formattedPrice = formattedIntegerPart;
    if (parts.length > 1) {
      formattedPrice += '.${parts[1]}';
    }

    return formattedPrice;
  }
}
