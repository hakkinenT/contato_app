import 'package:brasil_fields/brasil_fields.dart';
import 'package:contato_app/models/contato.dart';
import 'package:contato_app/stores/contato_list.dart';
import 'package:contato_app/widgets/custom_text_form_Field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class CadastrarContato extends StatefulWidget {
  const CadastrarContato({Key? key}) : super(key: key);

  @override
  _CadastrarContatoState createState() => _CadastrarContatoState();
}

class _CadastrarContatoState extends State<CadastrarContato> {
  final _formKey = GlobalKey<FormState>();
  String? categoriaContato;
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ContactList>(context);

    Future<String?> _showDialogSucess() async {
      return showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              titlePadding: EdgeInsets.all(30),
              title: Column(
                children: [
                  Icon(
                    Icons.check_circle_outline_outlined,
                    size: 50,
                    color: Colors.green,
                  ),
                  Text('Sucesso!'),
                  Divider(),
                  Text(
                    'O contato foi cadastrado com sucesso!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  )
                ],
              ),
              actionsPadding: EdgeInsets.only(bottom: 10),
              actions: [
                Center(
                  child: Container(
                    height: 35.0,
                    width: 70.0,
                    child: TextButton(
                      child: Text(
                        'OK',
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 17.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                )
              ],
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cadastrar Contato',
            style: TextStyle(color: Colors.blueAccent[700]),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 32, bottom: 20, left: 20, right: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: 'Nome',
                    controller: nameController,
                    onSaved: (newValue) {
                      nameController.text = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'Informe um nome válido';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    labelText: 'Telefone',
                    controller: phoneController,
                    onSaved: (newValue) {
                      phoneController.text = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return 'Informe um telefone válido';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                  ),
                  CustomTextFormField(
                    labelText: 'E-mail',
                    controller: emailController,
                    onSaved: (newValue) {
                      emailController.text = newValue!;
                    },
                    validator:
                        EmailValidator(errorText: 'Informe um e-mail válido'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _dropdownButtonFormField((newValue) {
                    categoriaContato = newValue;
                  }),
                  SizedBox(
                      height: 48,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            var contact = Contact(
                                name: nameController.text,
                                phoneNumber: phoneController.text,
                                email: emailController.text,
                                contactCategory: categoriaContato!);

                            list.addContacts(contact);

                            await _showDialogSucess();
                            _clearTextFields();
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('Cadastrar Contato'),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor),
                      ))
                ],
              )),
        ));
  }

  void _clearTextFields() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
  }

  Container _dropdownButtonFormField(Function(String?) onChanged) {
    List<String> categorias = ['Trabalho', 'Amigos', 'Universidade'];
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      height: 55,
      child: DropdownButtonFormField<String>(
        autofocus: false,
        items: categorias
            .map((String categoria) =>
                DropdownMenuItem(value: categoria, child: Text(categoria)))
            .toList(),
        value: categoriaContato,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: 'Selecione uma categoria',
            contentPadding:
                EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16, right: 16.0),
            filled: true,
            fillColor: Colors.black.withAlpha(20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
