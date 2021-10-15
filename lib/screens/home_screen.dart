import 'package:flutter/material.dart';
import 'package:smart_finance/widgets/app_bottom_nav.dart';
import 'package:smart_finance/screens/fatura_screen.dart';
// import 'package:smart_finance/screens/fatura_screen.dart';
import 'package:smart_finance/screens/saldo_screen.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8257e5),
      appBar: AppBar(
          elevation: 0, backgroundColor: Color(0xff8257e5), title: Text('')),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 260,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/teste.png",
                ),
              ),
            ),
          ),
          Container(
            width: 410,
            height: 25,
            child: Container(
              margin: new EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              child: Text("Seja bem-vindo.",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          Container(
            width: 410,
            height: 55,
            child: Container(
              margin: new EdgeInsets.symmetric(horizontal: 50.0),
              child: Text("O que deseja consultar?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            margin: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 135,
                        height: 150,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              FaturaMensalScreen.routeName,
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Color(0xff9871f5),
                                ),
                              ),
                              Positioned(
                                bottom: 20.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  padding: new EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 0),
                                  child: Column(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          "assets/images/invoice.png",
                                        ),
                                        fit: BoxFit.cover,
                                        height: 60.3,
                                        width: 60.3,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('Gastos',
                                          style: Constants.gridTextStyle)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SaldoScreen.routeName);
                          },
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                margin: new EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 0),
                                width: 135,
                                height: 150,
                                color: Color(0xff04d361),
                              ),
                            ),
                            Positioned(
                              bottom: 20.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/saldo.png',
                                      //fit: BoxFit.cover,
                                      height: 60.3,
                                      width: 60.3,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text('Saldo',
                                        style: Constants.gridTextStyle)
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: 0,
      ),
    );
  }
}
