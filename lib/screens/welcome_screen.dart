import 'package:flutter/material.dart';
import 'package:smart_finance/screens/auth_screen.dart';
//import 'package:smart_finance/screens/auth_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/welcome";

  const WelcomeScreen({Key? key}) : super(key: key);

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
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/login2.png",
                ),
              ),
            ),
          ),
          // Container(
          //   width: 410,
          //   height: 25,
          //   child: Container(
          //     margin: new EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
          //     child: Text("Seja bem-vindo.",
          //         style: TextStyle(color: Colors.white, fontSize: 20)),
          //   ),
          // ),
          Container(
            margin: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 285,
                        height: 50,

                        //   child: ElevatedButton(
                        //     child: Text(_authMode == AuthMode.Login
                        //         ? 'Login'
                        //         : 'Cadastra-se'),
                        //     onPressed: _submit,
                        //     style: ElevatedButton.styleFrom(
                        //       primary: Color(0xff19191c),
                        //       onPrimary: Colors.white,
                        //       shape: const RoundedRectangleBorder(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(30))),
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: 30.0, vertical: 8.0),
                        //     ),
                        //   ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AuthScreen.routeName,
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                bottom: 15.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  padding: new EdgeInsets.symmetric(
                                      horizontal: 0.0, vertical: 0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text('ABRIR CONTA',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff19191c),
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AuthScreen.routeName);
                          },
                          child: Stack(children: [
                            ClipRRect(
                              //borderRadius: BorderRadius.circular(0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.white,
                                  ),
                                ),

                                width: 285,
                                height: 50,
                                //color: Colors.black38,
                                // decoration: BoxDecoration(
                                //     border: Border.all(
                                //         width: 5, color: Colors.white)),
                              ),
                            ),
                            Positioned(
                              bottom: 15.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text('JÁ TENHO CONTA',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
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
