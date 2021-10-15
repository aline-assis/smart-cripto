import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:smart_finance/screens/home_screen.dart';

class BancoKey extends StatelessWidget {
  @override
  // var keyBanco;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent[200],
        title: Text('Key do Banco'),
      ),
      body: FormBuilder(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormBuilderTextField(
                  name: 'keyBanco',
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: 'Digite um número',
                      fillColor: Colors.white70),
                  //validator: FormBuilderTextField.noMaxLength(context, 2),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            new MaterialPageRoute(builder: (context) => new HomeScreen()),
          );
        },
      ),
    );
  }
}
