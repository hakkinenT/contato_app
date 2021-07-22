import 'package:contato_app/stores/contato.dart';
import 'package:contato_app/stores/contato_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CadastrarContato extends StatefulWidget {
  const CadastrarContato({Key? key}) : super(key: key);

  @override
  _CadastrarContatoState createState() => _CadastrarContatoState();
}

class _CadastrarContatoState extends State<CadastrarContato> {
  final _formKey = GlobalKey<FormState>();
  String? categoriaContato;

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ContactList>(context);
    final formContact = Provider.of<Contact>(context);

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
                  Observer(
                      builder: (_) => _textFormField('Nome', (newValue) {
                            formContact.name = newValue;
                          })),
                  Observer(
                      builder: (_) => _textFormField('Telefone', (newValue) {
                            formContact.phoneNumber = newValue;
                          })),
                  Observer(
                      builder: (_) => _textFormField('Email', (newValue) {
                            formContact.email = newValue;
                          })),
                  Observer(
                      builder: (_) => _dropdownButtonFormField((newValue) {
                            categoriaContato = newValue;
                            formContact.contactCategory = newValue!;
                          })),
                  SizedBox(
                      height: 48,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () {
                          print(
                              '${formContact.name}, ${formContact.email}, ${formContact.contactCategory}, ${formContact.phoneNumber}');
                          _formKey.currentState!.save();
                          list.addContacts(formContact);
                          Navigator.of(context).pop();
                        },
                        child: Text('Cadastrar Contato'),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor),
                      ))
                ],
              )),
        ));
  }

  Container _textFormField(String label, Function(String) onChanged) {
    return Container(
        margin: EdgeInsets.only(bottom: 16.0),
        height: 48,
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
              labelText: label,
              contentPadding:
                  EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
              filled: true,
              fillColor: Colors.black.withAlpha(20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none)),
        ));
  }

  Container _dropdownButtonFormField(Function(String?) onChanged) {
    List<String> categorias = ['Trabalho', 'Amigos', 'Universidade'];
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      height: 55,
      child: DropdownButtonFormField<String>(
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
