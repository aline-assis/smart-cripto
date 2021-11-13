import 'package:smart_finance/models/currency.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

enum CurrencyColumn { id, rank, name, price, oneHChange, oneDChange, marketCap }

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;

  @override
  List<DataGridRow> get row => _currencies;

  CurrencyDataSource({required List<Currency> currencies}) {
    buildDataGrid(currencies);
  }

  void buildDataGrid(List<Currency> currencies) => currencies
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
        return Text('Hello');
      }).toList());
}
