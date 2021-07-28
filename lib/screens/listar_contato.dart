import 'package:contato_app/screens/cadastrar_contato.dart';
import 'package:contato_app/screens/detalhes_contato.dart';
import 'package:contato_app/stores/contato_list.dart';
import 'package:contato_app/widgets/app_drawer.dart';
import 'package:contato_app/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ListarContato extends StatelessWidget {
  const ListarContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ContactList>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Contatos',
            style: TextStyle(color: Colors.blueAccent[700]),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CadastrarContato()));
                },
                icon: Icon(Icons.add, color: Theme.of(context).accentColor))
          ],
        ),
        drawer: AppDrawer(),
        body: Observer(
          builder: (_) => ListView.separated(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                final contact = list.contacts[index];

                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    child: Text(
                      '${contact.name[0]}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: PopupMenu(
                    contact: contact,
                    callback: (bool value) {
                      if (value) {
                        list.removeContact(contact);
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetalhesDoContato(contact: contact),
                    ));
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: list.contacts.length),
        ));
  }
}
