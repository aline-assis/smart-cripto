import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_finance/providers/currency_provider.dart';
import 'package:smart_finance/utils/currency_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CurrenciesWidget extends StatelessWidget {
  const CurrenciesWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencyDataSource;

    if (currencyDataSource == null) {
      return Center(child: CircularProgressIndicator());
    } else
      return SfDataGrid(
        allowSorting: true,
        defaultColumnWidth: 110,
        columns: buildGridCollumns(),
        source: currencyDataSource,
      );
  }

  List<GridColumn> buildGridCollumns() => <GridColumn>[
        GridColumn(
          columnName: CurrencyColumn.id.toString(),
          label: Container(
              color: Color(0xff1a2027),
              alignment: Alignment.center,
              child: Text('Token', style: TextStyle(color: Colors.white24))),
        ),
        GridColumn(
          columnName: CurrencyColumn.rank.toString(),
          maximumWidth: 80,
          label: Container(
              color: Color(0xff1a2027),
              alignment: Alignment.center,
              child: Text('Rank', style: TextStyle(color: Colors.white24))),
        ),
        GridColumn(
          columnName: CurrencyColumn.name.toString(),
          label: Container(
              color: Color(0xff1a2027),
              alignment: Alignment.center,
              child: Text('Nome', style: TextStyle(color: Colors.white24))),
        ),
        GridColumn(
          columnName: CurrencyColumn.price.toString(),
          label: Container(
              color: Color(0xff1a2027),
              alignment: Alignment.center,
              child: Text('Preço', style: TextStyle(color: Colors.white24))),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneHChange.toString(),
          label: Container(
              color: Color(0xff1a2027),
              alignment: Alignment.center,
              child: Text('1h atras', style: TextStyle(color: Colors.white24))),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneDChange.toString(),
          label: Container(
              color: Color(0xff1a2027),
              alignment: Alignment.center,
              child: Text('Ontem', style: TextStyle(color: Colors.white24))),
        ),
        GridColumn(
          columnName: CurrencyColumn.marketCap.toString(),
          label: Container(
              color: Color(0xff1a2027),
              alignment: Alignment.center,
              child: Text('Mercado', style: TextStyle(color: Colors.white24))),
        ),
      ];

  Widget buildLabel(String text) => Text(
        text,
      );
}
