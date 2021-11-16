import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_finance/grafico/menu_controller.dart';
import 'package:smart_finance/grafico/widget/quote_list.dart';
import 'package:smart_finance/grafico/widget/top_grafico.dart';
import 'package:smart_finance/grafico/widget/top_quotes.dart';
import 'package:smart_finance/widgets/app_bottom_nav.dart';

class Grafico extends StatelessWidget {
  static const routeName = "/graficoScreen";
  const Grafico({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        backgroundColor: Color(0xff19191c),
        appBar: PreferredSize(
          preferredSize: Size(_screenSize.width, 1000),
          child: Container(
            color: Color(0xff19191c),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Crypto-Dashboard',
                    style: TextStyle(color: Colors.white24),
                  ),
                ],
              ),
            ),
          ),
        ),
        //drawer: SideMenu(), menuzinho do lado
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopChartWidget(),
                          SizedBox(height: 25),
                          TopQuoteWidget(),
                          SizedBox(height: 25),
                          QuoteListWidget(),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AppBottomNavigation(
          selectedIndex: 0,
        ),
      ),
    );
  }
}
