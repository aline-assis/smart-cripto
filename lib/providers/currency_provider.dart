import 'package:flutter/cupertino.dart';
import 'package:smart_finance/api/crypto_provider.dart';
import 'package:smart_finance/models/currency.dart';
import 'package:smart_finance/utils/currency_data_source.dart';

class CurrencyProvider extends ChangeNotifier {
  CurrencyDataSource? currencyDataSource;
  List<Currency> currencies = [];

  CurrencyProvider() {
    loadCurrencies();
  }

  Future loadCurrencies() async {
    final currencies = await CryptoApi.getCurrencies();

    this.currencies = currencies;
    currencyDataSource = CurrencyDataSource(currencies: currencies);
    notifyListeners();
  }
}
