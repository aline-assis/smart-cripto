import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_finance/grafico/model/quote.dart';
import 'package:smart_finance/grafico/provider/crypto_provider_grafico.dart';
import 'package:smart_finance/grafico/responsive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VolumeAllCurrencyData {
  String? name;
  int? value;

  VolumeAllCurrencyData({this.name, this.value});
}

class QuoteListWidget extends StatefulWidget {
  @override
  _QuoteListWidgetState createState() => _QuoteListWidgetState();
}

class _QuoteListWidgetState extends State<QuoteListWidget> {
  List<VolumeAllCurrencyData> _volumeAllCurrencies = [];
  List<Quote> _quoteList = [];
  late Timer timer;

  @override
  void initState() {
    fetchQuoteList();
    fetchDataForPieChart();
    super.initState();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetchQuoteList();
      fetchDataForPieChart();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void fetchDataForPieChart() async {
    List<Quote> quotes =
        await Provider.of<CryptoProviderGrafico>(context, listen: false)
            .fetchQuote(15);
    List<VolumeAllCurrencyData> v = [];
    quotes.forEach((element) {
      VolumeAllCurrencyData data = VolumeAllCurrencyData(
        name: element.shortName,
        value: element.volumeAllCurrencies!.raw,
      );
      v.add(data);
    });

    setState(() {
      _volumeAllCurrencies = v;
    });
  }

  void fetchQuoteList() async {
    List<Quote> quotes =
        await Provider.of<CryptoProviderGrafico>(context, listen: false)
            .fetchQuote(15);
    setState(() {
      _quoteList = quotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Response.isSmallScreen(context)
          ? Column(
              children: [
                pieChartCard(),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  child: quoteTableCard(),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: pieChartCard(),
                ),
                Expanded(
                  flex: 4,
                  child: quoteTableCard(),
                ),
              ],
            ),
    );
  }

  Widget pieChartCard() {
    return Container(
      child: Card(
        color: Color(0xff1a2027),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Container(
              child: SfCircularChart(
                title: ChartTitle(
                    text: 'Valor de cada moeda em USD',
                    textStyle: TextStyle(color: Colors.white70)),
                legend: Legend(isVisible: true),
                series: <CircularSeries>[
                  DoughnutSeries<VolumeAllCurrencyData, String>(
                    dataSource: _volumeAllCurrencies,
                    xValueMapper: (VolumeAllCurrencyData v, _) => v.name,
                    yValueMapper: (VolumeAllCurrencyData v, _) => v.value,
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle:
                            TextStyle(color: Colors.white70, fontSize: 12.5)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget quoteTableCard() {
    return Container(
      child: Card(
        color: Color(0xff1a2027),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(15),
          child: DataTable(
            horizontalMargin: 0,
            columnSpacing: 5,
            columns: [
              if (!Response.isSmallScreen(context))
                DataColumn(
                  label:
                      Text('Symbol', style: TextStyle(color: Colors.white70)),
                ),
              DataColumn(
                label: Text('Nome', style: TextStyle(color: Colors.white70)),
              ),
              DataColumn(
                label: Text('Preço', style: TextStyle(color: Colors.white70)),
              ),
              DataColumn(
                label:
                    Text('Alteração', style: TextStyle(color: Colors.white70)),
              ),
              DataColumn(
                label: Text('% Alteração',
                    style: TextStyle(color: Colors.white70)),
              ),
            ],
            rows: _quoteList
                .map((quote) => new DataRow(
                      cells: [
                        if (!Response.isSmallScreen(context))
                          DataCell(
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage('${quote.coinImageUrl}'),
                                    radius: 12,
                                  ),
                                  SizedBox(width: 5),
                                  Text('${quote.symbol}'),
                                ],
                              ),
                            ),
                          ),
                        DataCell(
                          Response.isSmallScreen(context)
                              ? Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            '${quote.coinImageUrl}'),
                                        radius: 12,
                                      ),
                                      SizedBox(width: 5),
                                      Text('${quote.symbol}'),
                                    ],
                                  ),
                                )
                              : Text('${quote.shortName}',
                                  style: TextStyle(color: Colors.white24)),
                        ),
                        DataCell(
                          Text(
                            '${quote.regularMarketPrice!.fmt}',
                            style: TextStyle(
                              color: !'${quote.regularMarketPrice!.fmt}'
                                      .startsWith('-')
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '${quote.regularMarketChange!.fmt}',
                            style: TextStyle(
                              color: !'${quote.regularMarketChange!.fmt}'
                                      .startsWith('-')
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '${quote.regularMarketChangePercent!.fmt}',
                            style: TextStyle(
                              color: !'${quote.regularMarketChangePercent!.fmt}'
                                      .startsWith('-')
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
