import 'package:price_flutter_app/data/datasource/currency_datasource.dart';
import 'package:price_flutter_app/data/model/currency.dart';
import 'package:price_flutter_app/di/di.dart';

abstract class ICurrencyRepository {
  Future<List<Currency>> getCurrency();
}

class CurrencyRepository implements ICurrencyRepository {
  @override
  Future<List<Currency>> getCurrency() async {
    try {
      final ICurrencyDatasource _datasource = locator.get();
      List<Currency> currenciesList = await _datasource.getCurrency();
      return currenciesList;
    } catch (ex) {
      throw Exception('$ex');
    }
  }
}