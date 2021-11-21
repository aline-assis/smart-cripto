import 'package:flutter/material.dart';
import 'package:smart_finance/screens/geral_screen.dart';
import 'package:smart_finance/screens/home_screen.dart';
import 'package:smart_finance/utils/styles.dart';
import 'package:smart_finance/widgets/app_bottom_nav.dart';
import 'package:smart_finance/widgets/body.dart';

class PerfilScreen extends StatelessWidget {
  static const routeName = "/perfil";
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff19191c),
        appBar: AppBar(
          centerTitle: true,
          // title: Text("Perfil",
          //     style: TextStyle(fontSize: 35, color: Colors.white70)),
          backgroundColor: Color(0xff19191c),
        ),
        body: Body(),
        bottomNavigationBar: AppBottomNavigation(
          selectedIndex: 2,
        ),
      ),
    );
  }
}
