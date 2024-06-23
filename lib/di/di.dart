import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:price_flutter_app/constants/currencies_symbols.dart';
import 'package:price_flutter_app/data/datasource/currency_datasource.dart';
import 'package:price_flutter_app/data/repository/currency_repository.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //Components
  locator.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: "https://api.priceto.day/v1/")));
  locator.registerSingleton<List<String>>(symbolsList);

  //Datasources
  locator.registerFactory<ICurrencyDatasource>(() => CurrencyDatasource());

  //Repositories
  locator.registerFactory<ICurrencyRepository>(() => CurrencyRepository());
}