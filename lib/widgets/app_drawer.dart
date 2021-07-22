import 'package:contato_app/screens/cadastrar_contato.dart';
import 'package:contato_app/screens/listar_contato.dart';
import 'package:contato_app/screens/listar_contatos_favoritos.dart';
import 'package:contato_app/screens/termo_de_uso.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Nome do Usuário'),
            accountEmail: Text('email@email.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              child: Text(
                'U',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            title: Text('Cadastrar Contato'),
            onTap: () => sendTo(context, CadastrarContato()),
            leading: Icon(Icons.contact_page),
          ),
          ListTile(
            title: Text('Contatos'),
            leading: Icon(Icons.contacts),
            onTap: () => sendTo(context, ListarContato()),
          ),
          ListTile(
            title: Text('Favoritos'),
            leading: Icon(Icons.favorite),
            onTap: () => sendTo(context, ListarContatosFavoritos()),
          ),
          ListTile(
            title: Text('Termos de Uso'),
            leading: Icon(Icons.description),
            onTap: () => sendTo(context, TermosDeUso()),
          )
        ],
      ),
    );
  }

  sendTo(BuildContext context, Widget page) {
    Navigator.of(context).pop();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page), ModalRoute.withName("/"));
  }
}
