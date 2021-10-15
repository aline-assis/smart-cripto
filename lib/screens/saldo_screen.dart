import 'package:flutter/material.dart';
import 'package:smart_finance/providers/saldo_total_provider.dart';
import 'package:smart_finance/models/saldo.dart';

class SaldoScreen extends StatelessWidget {
  static const routeName = "/saldo-screen";
  List<String> meuAssets = [
    "assets/images/nubank.png",
    "assets/images/bradesco3.png",
    "assets/images/inter.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff8257e5),
        actions: [
          SaldoTotal([
            Saldo(
                saldoNubank: 800.0, saldoInter: 2300.00, saldoBradesco: 1000.0),
            Saldo(
                saldoNubank: 800.0,
                saldoInter: 2300.00,
                saldoBradesco: 15600.0),
          ]),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xff8257e5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saldo Disponível',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      "assets/images/saldo.png",
                    ))),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: meuAssets.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                alignment: Alignment.bottomLeft,
                                image: AssetImage(
                                  meuAssets[index],
                                ),
                              ),
                            ),
                            Text('Saldo: R\$\800,00',
                                style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
