import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:price_flutter_app/data/datasource/currency_datasource.dart';
import 'package:price_flutter_app/data/model/currency.dart';
import 'package:price_flutter_app/data/repository/currency_repository.dart';
import 'package:price_flutter_app/di/di.dart';
import 'package:price_flutter_app/util/api_exception.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final ICurrencyRepository currencyRepository = locator.get();
  final ICurrencyDatasource currencyDatasource = locator.get();

  HomeScreenBloc() : super(HomeLoading()) {
    on<HomeScreenEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          final currencies = await currencyRepository.getCurrency();
          emit(HomeSuccess(currencies: currencies));
        } catch (ex) {
          emit(HomeError(
              apiException: ApiException(0, "Something went wrong!")));
        }
      }
    });
  }
}
