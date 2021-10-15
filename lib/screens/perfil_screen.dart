import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_finance/providers/perfil_provider.dart';
import 'package:smart_finance/widgets/app_bottom_nav.dart';
import '/models/perfil.dart';
import '/widgets/app_drawer.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';

class PerfilFormScreen extends StatefulWidget {
  static const routeName = '/perfil-form';
  const PerfilFormScreen({Key? key}) : super(key: key);

  @override
  _PerfilFormScreenSate createState() => _PerfilFormScreenSate();
}

DateTime selectedDate = DateTime.now();
TextEditingController _dateController = new TextEditingController();
TextEditingController _cpfController = new TextEditingController();
// TextEditingController _bancoController = new TextEditingController();

class _PerfilFormScreenSate extends State<PerfilFormScreen> {
  final _cpfFocusNode = FocusNode();
  // final _bancoFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var errorMessage = '';
  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskCNPJ = MaskTextInputFormatter(
      mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});
  String? _perfilId = "";
  var _formPerfil = Perfil(
    id: null,
    cpf: '',
    date: DateTime(2003, 02, 20),
    // banco: '',
  );

  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      final perfilProvider = Provider.of<PerfilProvider>(context);
      await perfilProvider.fetchAndSetPerfil().then(
        (_) {
          if (perfilProvider.perfil != null) {
            _formPerfil = perfilProvider.perfil!;
            _perfilId = _formPerfil.id;
            _dateController.text = _formPerfil.date.toString();
            _cpfController.text = _formPerfil.cpf;
            // _bancoController.text = _formPerfil.banco;
          }
        },
      );
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  // @override
  // void dispose() {
  //   _bancoFocusNode.dispose();
  //   super.dispose();
  // }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_perfilId != null) {
      Provider.of<PerfilProvider>(context, listen: false)
          .updatePerfil(_perfilId!, _formPerfil);
    } else {
      Provider.of<PerfilProvider>(context, listen: false)
          .addPerfil(_formPerfil)
          .catchError((error) {
        errorMessage = error.toString();
        return showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Aconteceu um erro!'),
            content: Text('asdasd'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              )
            ],
          ),
        );
      }).then((_) {
        setState(() {
          _isLoading = false;
        });
        if (errorMessage.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Dados inserido com sucesso!'),
            behavior: SnackBarBehavior.fixed,
          ));
        }

        Navigator.of(context).pop();
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _dateController.value = TextEditingValue(text: picked.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent[200],
        title: Text('Configuração de Perfil'),
        // actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _dateController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: 'Data de Nascimento',
                              prefixIcon: Icon(
                                Icons.dialpad,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' não pode ser vazio';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_cpfFocusNode);
                            },
                            onSaved: (value) {
                              _formPerfil = new Perfil(
                                cpf: _formPerfil.cpf,
                                date: DateTime.parse(value!),
                              );
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [maskCpf],
                        decoration: InputDecoration(labelText: 'CPF:'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        focusNode: _cpfFocusNode,
                        controller: _cpfController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'O CPF não pode ser vazio!';
                          }
                          // if (double.tryParse(value) == null) {
                          //   return 'Por favor, informe um número válido';
                          // }
                          // if (double.parse(value) <= 0) {
                          //   return 'O preço não pode ser menor ou igual a zero';
                          // }
                          return null;
                        },
                        onSaved: (value) {
                          _formPerfil = new Perfil(
                            cpf: value!,
                            date: _formPerfil.date,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(Icons.save),
        onPressed: _saveForm,
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: 2,
      ),
    );
  }
}

// final exampleCheckboxGroup = FormBuilderCheckboxGroup(
//   name: 'name',
//   options: [
//     FormBuilderFieldOption(
//       value: 'nubank',
//       child: Text('Nubank'),
//     ),
//     FormBuilderFieldOption(
//       value: 'inter',
//       child: Text('inter'),
//     ),
//     FormBuilderFieldOption(
//       value: 'bradesco',
//       child: Text('bradesco'),
//     )
//   ],
// );
