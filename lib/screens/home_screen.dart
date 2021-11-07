import 'package:flutter/material.dart';
import 'package:smart_finance/widgets/app_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19191c),
      appBar: AppBar(
          elevation: 0, backgroundColor: Color(0xff19191c), title: Text('')),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 260,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(
            //       "assets/images/teste.png",
            //     ),
            //   ),
            // ),
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
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: 0,
      ),
    );
  }
}
