import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_finance/cripto/background.dart';

class TesteScreen extends StatelessWidget {
  static const routeName = "/teste";
  const TesteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(color: Colors.white),
          ),
          TextFieldContainer(
            child: TextField(),
          )
        ],
        //color: Colors.red,

        // child: Stack( colocando imagem com possição
        //   alignment: Alignment.center,
        //   children: <Widget>[
        //     Positioned(
        //       top: 0,
        //       left: 0,
        //       child: Image.asset(
        //         "assets/images/nubank.png",
        //         width: size.width * 0.35,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
