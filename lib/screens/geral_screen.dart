import 'package:flutter/material.dart';
import 'package:smart_finance/screens/home_screen.dart';
import 'package:smart_finance/utils/styles.dart';

class GeralScreen extends StatelessWidget {
  static const routeName = "/geral";
  const GeralScreen({Key? key}) : super(key: key);

//onWillPop https://youtu.be/eGwq3_0K_Sg
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19191c),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff19191c),
          title: Text('    Olá, Aline Assis!')),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 260,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //botao de avisos
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 90, vertical: 0),
                              width: 505,
                              height: 70,
                              color: Color(0xff19191c),
                            ),
                          ),
                          Positioned(
                            bottom: 7.0,
                            left: 0.0,
                            right: 289.0,
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Text('Nome de usuário', style: kSubtitleStyle)
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    //botao para configurar conta
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0),
                              width: 505,
                              height: 70,
                              color: Color(0xff19191c),
                            ),
                          ),
                          Positioned(
                            bottom: 7.0,
                            left: 0.0,
                            right: 289.0,
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 0,
                                    width: 20,
                                  ),
                                  Text('Visualização de moeda',
                                      style: kSubtitleStyle)
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    //botao de FAQ
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              margin: new EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 0),
                              width: 505,
                              height: 70,
                              color: Color(0xff19191c),
                            ),
                          ),
                          Positioned(
                            bottom: 7.0,
                            left: 0.0,
                            right: 289.0,
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Text('Senha', style: kSubtitleStyle)
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 410,
            height: 25,
            child: Container(
              margin: new EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              child: Text("Se não achou o que procurava,\n\n",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          Container(
            width: 410,
            height: 85,
            child: Container(
              margin: new EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                  "entre em contato com nosso time de suporte: smartcrypto@gmail.com",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            margin: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Container(
                      //   width: 135,
                      //   height: 150,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.of(context).pushNamed(
                      //         HomeScreen.routeName,
                      //       );
                      //     },
                      //     child: Stack(
                      //       children: [
                      //         ClipRRect(
                      //           borderRadius: BorderRadius.circular(10),
                      //           child: Container(
                      //             color: Color(0xff9871f5),
                      //           ),
                      //         ),
                      //         Positioned(
                      //           bottom: 20.0,
                      //           left: 0.0,
                      //           right: 0.0,
                      //           child: Container(
                      //             padding: new EdgeInsets.symmetric(
                      //                 horizontal: 0.0, vertical: 0),
                      //             child: Column(
                      //               children: [
                      //                 Image(
                      //                   image: AssetImage(
                      //                     "assets/images/invoice.png",
                      //                   ),
                      //                   fit: BoxFit.cover,
                      //                   height: 60.3,
                      //                   width: 60.3,
                      //                 ),
                      //                 SizedBox(
                      //                   height: 20,
                      //                 ),
                      //                 Text(
                      //                   'Gastos',
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      //botão para deslogar
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(HomeScreen.routeName);
                          },
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                margin: new EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 0),
                                width: 305,
                                height: 50,
                                color: Color(0xff1a2027),
                              ),
                            ),
                            Positioned(
                              bottom: 15.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                child: Column(
                                  children: [
                                    // Image.asset(
                                    //   'assets/images/saldo.png',
                                    //   //fit: BoxFit.cover,
                                    //   height: 60.3,
                                    //   width: 60.3,
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Salvar', style: kTitleStyle)
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
    );
  }
}
