import 'package:flutter/material.dart';
import 'package:smart_finance/widgets/profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Positioned(
            bottom: 10,
            child: SizedBox(
              height: 175,
              width: 175,
              child: CircleAvatar(
                  //backgroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/images/login2.png')),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ProfileMenu(
            text: "Minha Conta",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Configurações",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Fale Conosco",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Sair",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
