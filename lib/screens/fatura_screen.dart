// //GASTO DO MES

// import 'package:flutter/material.dart';
// import 'package:smart_finance/componets/app_drawer.dart';

// class FaturaMensal extends StatelessWidget {
//   static const routeName = "/fatura-mensal-screen";
//   const FaturaMensal({Key? key}) : super(key: key);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurpleAccent[200],
//         toolbarHeight: 250,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             SizedBox(height: 30),
//             Text('Saldo: R\$\4100,00', style: TextStyle(fontSize: 17)),
//             Container(
//               //Deixou com atributo de flex
//               padding: EdgeInsets.only(top: 110),
//               margin: EdgeInsets.all(0),
//               width: double.infinity,
//               alignment: Alignment.bottomLeft,
//               child: Column(
//                 children: [
//                   Text('Fatura do Mes', style: TextStyle(fontSize: 25)),
//                   Container(
//                     margin: EdgeInsets.all(25),
//                     width: 50,
//                     height: 50,
//                     child: Image(
//                       //alignment: Alignment.bottomLeft,
//                       alignment: Alignment.bottomLeft,
//                       image: AssetImage(
//                         "assets/images/invoice.png",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Image(
//                 alignment: Alignment.bottomLeft,
//                 image: AssetImage(
//                   "assets/images/nubank.png",
//                 ),
//               ),
//             ),
//             title: Text('Saldo: R\$\800,00', style: TextStyle(fontSize: 17)),
//             //subtitle: Text('mes'), // posso usar para mostrar o mes
//           ),
//           ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Image(
//                 alignment: Alignment.bottomLeft,
//                 image: AssetImage(
//                   "assets/images/bradesco3.png",
//                 ),
//               ),
//             ),
//             title: Text('Saldo: R\$\1000,00', style: TextStyle(fontSize: 17)),
//           ),
//           ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Image(
//                 alignment: Alignment.bottomLeft,
//                 image: AssetImage(
//                   "assets/images/inter.png",
//                 ),
//               ),
//             ),
//             title: Text('Saldo: R\$\2300,00', style: TextStyle(fontSize: 17)),
//           ),
//         ],
//       ),
//       drawer: AppDrawer(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:smart_finance/providers/fatura_mensal_provider.dart';
import 'package:smart_finance/models/fatura.dart';

class FaturaMensalScreen extends StatelessWidget {
  static const routeName = "/fatura-mensal-screen";
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
          FaturaMensal([
            Fatura(
                faturaNubank: 110.0,
                faturaInter: 300.00,
                faturaBradesco: 1000.0),
            Fatura(
                faturaNubank: 110.0,
                faturaInter: 300.00,
                faturaBradesco: 1000.0),
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
                  Text('Fatura do Mes',
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
                      "assets/images/invoice.png",
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
                                //alignment: Alignment.bottomLeft,
                                image: AssetImage(
                                  meuAssets[index],
                                ),
                              ),
                            ),
                            Text('Fatura: R\$\800,00',
                                style: TextStyle(fontSize: 17)),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      // drawer: AppDrawer(),
    );
  }
}
