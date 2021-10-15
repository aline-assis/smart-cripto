//SALDO TOTAL
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_finance/models/saldo.dart';
//import 'package:dio/dio.dart';

class SaldoTotal extends StatefulWidget {
  final List<Saldo> _saldos;

  SaldoTotal(this._saldos);

  @override
  _SaldoTotalState createState() => _SaldoTotalState();
}

class _SaldoTotalState extends State<SaldoTotal> {
  double valorTotalDoMes = 0.0;

  //ciclo de vida
  //init -> primeira etapa
  //didDependecesChnahe => segunda
  //dispose => final

  @override
  void initState() {
    atualizarOSaldoTotal();
    //CHAMADA DE API
    //getHttp();
    super.initState();
  }

  //chamada de API
  // void getHttp() async {
  //   try {
  //     Map<String, dynamic> map =  await Dio().get('http://www.google.com');
  //
  //     Saldo saldo = Saldo(saldoNubank: map["valor1"], saldoItau: map["valor1"], saldoBradesco: map["valor1"]);
  //
  //     setState(() {
  //       valorTotalDoMes = saldo.saldoNubank;
  //     });
  //
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void atualizarOSaldoTotal() {
    //todo setState serve para atualizar o estado

    setState(() {
      widget._saldos.map((saldo) {
        valorTotalDoMes = valorTotalDoMes + saldo.saldoBradesco;
        valorTotalDoMes = valorTotalDoMes + saldo.saldoInter;
        valorTotalDoMes = valorTotalDoMes + saldo.saldoNubank;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Text('Saldo: $valorTotalDoMes', style: TextStyle(fontSize: 17)),
      ],
    );
  }
}
