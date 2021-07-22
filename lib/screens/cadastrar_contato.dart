import 'package:contato_app/stores/contato.dart';
import 'package:contato_app/stores/contato_list.dart';
import 'package:flutter/material.dart';
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
                  _textFormField('Nome', nameController, (newValue) {
                    nameController.text = newValue!;
                  }),
                  _textFormField('Telefone', phoneController, (newValue) {
                    phoneController.text = newValue!;
                  }),
                  _textFormField('Email', emailController, (newValue) {
                    emailController.text = newValue!;
                  }),
                  _dropdownButtonFormField((newValue) {
                    categoriaContato = newValue;
                  }),
                  SizedBox(
                      height: 48,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          var contact = Contact(
                              name: nameController.text,
                              phoneNumber: phoneController.text,
                              email: emailController.text,
                              contactCategory: categoriaContato!);

                          list.addContacts(contact);
                          _clearTextFields();
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

  void _clearTextFields() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
  }

  Container _textFormField(String label, TextEditingController controller,
      Function(String?) onSaved) {
    return Container(
        margin: EdgeInsets.only(bottom: 16.0),
        height: 48,
        child: TextFormField(
          controller: controller,
          onSaved: onSaved,
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
