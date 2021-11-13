import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_finance/providers/currency_provider.dart';
import 'package:smart_finance/utils/currency_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CurrenciesWidget extends StatelessWidget {
  static const routeName = "/currenciesWidget";
  const CurrenciesWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencyDataSource;

    if (currencyDataSource == null) {
      return Center(child: CircularProgressIndicator());
    } else
      return SfDataGrid(
        columns: buildGridCollumns(),
        source: currencyDataSource,
      );
  }

  List<GridColumn> buildGridCollumns() => <GridColumn>[
        GridColumn(
          columnName: CurrencyColumn.id.toString(),
          label: buildLabel('ID'),
        ),
        GridColumn(
          columnName: CurrencyColumn.rank.toString(),
          maximumWidth: 80,
          label: buildLabel('Rank'),
        ),
        GridColumn(
          columnName: CurrencyColumn.name.toString(),
          label: buildLabel('Name'),
        ),
        GridColumn(
          columnName: CurrencyColumn.price.toString(),
          label: buildLabel('Price'),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneHChange.toString(),
          label: buildLabel('Last 1H'),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneDChange.toString(),
          label: buildLabel('Last day'),
        ),
        GridColumn(
          columnName: CurrencyColumn.marketCap.toString(),
          label: buildLabel('Market Cap'),
        ),
      ];

  Widget buildLabel(String text) => Text(
        text,
      );
}
