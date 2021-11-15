import 'package:flutter/material.dart';
import 'package:smart_finance/widgets/app_bottom_nav.dart';
import 'package:smart_finance/widgets/currencies_widget.dart';

class CurrencyScreen extends StatelessWidget {
  static const routeName = "/currencies";
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19191c),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff19191c),
          title: Text('Rank de Token',
              style: TextStyle(color: Colors.white, fontSize: 25))),
      body: SafeArea(
        child: CurrenciesWidget(),
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: 1,
      ),
    );
  }
}
