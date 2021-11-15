import 'package:smart_finance/models/currency.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CurrencyColumn { id, rank, name, price, oneHChange, oneDChange, marketCap }

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;

  @override
  List<DataGridRow> get rows => _currencies;

  CurrencyDataSource({required List<Currency> currencies}) {
    buildDataGrid(currencies);
  }

  void buildDataGrid(List<Currency> currencies) => _currencies = currencies
      .map<DataGridRow>(
        (currency) => DataGridRow(
          cells: CurrencyColumn.values
              .map(
                (column) => DataGridCell<Currency>(
                  columnName: column.toString(),
                  value: currency,
                ),
              )
              .toList(),
        ),
      )
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map<Widget>((dataGridCell) {
        final Currency currency = dataGridCell.value;
        final column = CurrencyColumn.values
            .firstWhere((value) => value.toString() == dataGridCell.columnName);

        switch (column) {
          case CurrencyColumn.id:
            return buildIdRow(currency);
          case CurrencyColumn.rank:
            return buildRankRow(currency.rank);
          case CurrencyColumn.price:
            return buildPriceRow(currency.price);
          case CurrencyColumn.name:
            return buildNameRow(currency);
          case CurrencyColumn.oneHChange:
            return buildPercentageRow(currency.oneHourChange);
          case CurrencyColumn.oneDChange:
            return buildPercentageRow(currency.oneDayChange);
          case CurrencyColumn.marketCap:
            return buildPriceRow(currency.marketCap);
        }
      }).toList());

  Widget buildIdRow(Currency currency) => Container(
        alignment: Alignment.center,
        color: Color(0xff19191c),
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLogo(currency),
            SizedBox(width: 8),
            Expanded(
                child: Text(currency.id,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      );
  Widget buildNameRow(Currency currency) => Container(
        alignment: Alignment.center,
        color: Color(0xff19191c),
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8),
            Expanded(
                child: Text(currency.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      );
  Widget buildRankRow(int rank) => Container(
        alignment: Alignment.center,
        color: Color(0xff19191c),
        padding: EdgeInsets.all(16),
        child: Text('$rank', style: TextStyle(color: Colors.white)),
      );

  Widget buildLogo(Currency currency) {
    final isSvg = currency.logoUrl.endsWith(".svg");
    return CircleAvatar(
      radius: 10,
      child: isSvg
          ? SvgPicture.network(currency.logoUrl)
          : Image.network(currency.logoUrl),
    );
  }

  Widget buildPercentageRow(double price) => Container(
        alignment: Alignment.center,
        color: Color(0xff19191c),
        padding: EdgeInsets.all(16),
        child: Text('\%$price', style: TextStyle(color: Colors.white)),
      );
  Widget buildPriceRow(double price) => Container(
        alignment: Alignment.center,
        color: Color(0xff19191c),
        padding: EdgeInsets.all(16),
        child:
            Text('\$$price', style: TextStyle(color: Colors.lightGreen[800])),
      );
}
