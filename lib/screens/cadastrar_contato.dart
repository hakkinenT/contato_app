import 'package:brasil_fields/brasil_fields.dart';
import 'package:contato_app/models/contact_model.dart';
import 'package:contato_app/stores/contato.dart';
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
  String _title = 'Cadastrar Contato';
  bool _isEdit = false;
  String? _id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Contact? contact =
        ModalRoute.of(context)?.settings.arguments as Contact?;

    if (contact != null) {
      setState(() {
        _isEdit = true;

        _title = 'Editar Contato';

        _id = contact.id;
        nameController.text = contact.name;
        emailController.text = contact.email;
        phoneController.text = contact.phoneNumber;
        categoriaContato = contact.contactCategory;
      });
    }
  }

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
                  !_isEdit
                      ? Text(
                          'O contato foi cadastrado com sucesso!',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.black54),
                        )
                      : Text(
                          'O contato foi editado com sucesso!',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.black54),
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
            _title,
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
                    validator: nameValidator,
                  ),
                  CustomTextFormField(
                    labelText: 'Telefone',
                    controller: phoneController,
                    onSaved: (newValue) {
                      phoneController.text = newValue!;
                    },
                    validator: phoneValidator,
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
                    validator: emailValidator,
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

                            ContactModel contactModel;

                            if (!_isEdit) {
                              contactModel = ContactModel(
                                  name: nameController.text,
                                  phoneNumber: phoneController.text,
                                  email: emailController.text,
                                  contactCategory: categoriaContato!);

                              list.addContacts(contactModel);
                            } else {
                              contactModel = ContactModel(
                                  id: _id,
                                  name: nameController.text,
                                  phoneNumber: phoneController.text,
                                  email: emailController.text,
                                  contactCategory: categoriaContato!);

                              list.updateContact(contactModel);
                            }

                            await _showDialogSucess();
                            _clearTextFields();
                            Navigator.of(context).pop();
                          }
                        },
                        child: _isEdit
                            ? Text('Editar Contato')
                            : Text('Cadastrar Contato'),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor),
                      ))
                ],
              )),
        ));
  }

  final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'É necessário informar um nome'),
    MinLengthValidator(4, errorText: 'Informe um nome válido')
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'É necessário informar um email'),
    EmailValidator(errorText: 'Informe um email válido')
  ]);

  final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'É necessário informar um número de telefone'),
    MinLengthValidator(8, errorText: 'Informe um número de telefone válido')
  ]);

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
