import 'package:contato_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

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
                  _textFormField('Nome'),
                  _textFormField('Telefone'),
                  _textFormField('Email'),
                  _dropdownButtonFormField(),
                  SizedBox(
                      height: 48,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Cadastrar Contato'),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor),
                      ))
                ],
              )),
        ));
  }

  Container _textFormField(String label) {
    return Container(
        margin: EdgeInsets.only(bottom: 16.0),
        height: 48,
        child: TextFormField(
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

  Container _dropdownButtonFormField() {
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
        onChanged: (newValue) {
          setState(() {
            categoriaContato = newValue;
          });
        },
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
