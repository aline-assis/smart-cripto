//SALDO TOTAL
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_finance/models/fatura.dart';
//import 'package:dio/dio.dart';

class FaturaMensal extends StatefulWidget {
  final List<Fatura> _faturas;

  FaturaMensal(this._faturas);

  @override
  _FaturaMensalState createState() => _FaturaMensalState();
}

class _FaturaMensalState extends State<FaturaMensal> {
  double faturaDoMes = 0.0;

  //ciclo de vida
  //init -> primeira etapa
  //didDependecesChnahe => segunda
  //dispose => final

  @override
  void initState() {
    atualizarFaturaMensal();
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

  void atualizarFaturaMensal() {
    //todo setState serve para atualizar o estado

    setState(() {
      widget._faturas.map((fatura) {
        faturaDoMes = faturaDoMes + fatura.faturaNubank;
        faturaDoMes = faturaDoMes + fatura.faturaBradesco;
        faturaDoMes = faturaDoMes + fatura.faturaInter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Text('Fatura: $faturaDoMes', style: TextStyle(fontSize: 17)),
      ],
    );
  }
}
