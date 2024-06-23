import 'package:dio/dio.dart';
import 'package:price_flutter_app/constants/currencies_symbols.dart';
import 'package:price_flutter_app/data/model/currency.dart';
import 'package:price_flutter_app/di/di.dart';
import 'package:price_flutter_app/util/api_exception.dart';

abstract class ICurrencyDatasource {
  Future<List<Currency>> getCurrency();
}

class CurrencyDatasource implements ICurrencyDatasource {
  final Dio _dio = locator.get();
  final List<Currency> currenciesList = [];

  @override
  Future<List<Currency>> getCurrency() async {
    try {
      symbolsList.forEach((symbol) async {
        final response = await _dio.get("latest/irr/$symbol");
        currenciesList.add(Currency(response.data["price"], symbol));
      });
      return currenciesList;
    } on DioException catch (ex) {
      throw ApiException(
          ex.response?.statusCode, "Error while getting price!");
    } catch (ex) {
      throw ApiException(0, "Unknown Error!");
    }
  }
}
