import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_finance/grafico/model/indicator.dart';
import 'package:smart_finance/grafico/provider/crypto_provider_grafico.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:smart_finance/grafico/responsive.dart';

class TopChartWidget extends StatefulWidget {
  @override
  _TopChartWidgetState createState() => _TopChartWidgetState();
}

class _TopChartWidgetState extends State<TopChartWidget> {
  List<Indicator> _trendingChartData = [];
  String _trendingCurrency = '';
  late Timer timer;

  @override
  void initState() {
    fetchTrendingChartData();
    super.initState();

    // Refresh new data every 5secs.
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetchTrendingChartData();
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Stop timer when repaint.
    super.dispose();
  }

  void fetchTrendingChartData() async {
    List<String> tickers =
        await Provider.of<CryptoProviderGrafico>(context, listen: false)
            .fetchTrendingTickers(5);
    List<Indicator> chartData =
        await Provider.of<CryptoProviderGrafico>(context, listen: false)
            .fetchChartData(tickers.first);
    setState(() {
      _trendingChartData = chartData;
      _trendingCurrency = tickers.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff19191c),
      child: Card(
        elevation: 5,
        child: Container(
          color: Color(0xff1a2027),
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(isVisible: false),
            title: ChartTitle(
                text: 'Trending Tickers - $_trendingCurrency',
                textStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                )),
            legend: Response.isLargeScreen(context)
                ? Legend(
                    isVisible: true,
                    textStyle: TextStyle(color: Colors.white70, fontSize: 12))
                : Legend(
                    isVisible: false,
                    textStyle: TextStyle(color: Colors.white70, fontSize: 12)),
            tooltipBehavior: TooltipBehavior(
              enable: true,
              textStyle: TextStyle(color: Colors.white70, fontSize: 10),
            ),
            series: <ChartSeries<Indicator, String>>[
              AreaSeries(
                color: Color(0xFF003C62),
                dataSource: _trendingChartData,
                xValueMapper: (Indicator ind, _) => ind.timestamp.toString(),
                pointColorMapper: (xValueMapper, _) => Colors.red,
                yValueMapper: (Indicator ind, _) => ind.close,
                name: '$_trendingCurrency',

                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    textStyle:
                        TextStyle(color: Colors.white70, fontSize: 12.5)),
                //pointColorMapper: (ColumnColors sales, _) => sales.pointColorMapper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
