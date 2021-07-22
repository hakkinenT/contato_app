import 'package:contato_app/screens/detalhes_contato.dart';
import 'package:contato_app/stores/contato_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ListarContatosFavoritos extends StatelessWidget {
  const ListarContatosFavoritos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ContactList>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Contatos Favoritos',
            style: TextStyle(color: Colors.blueAccent[700]),
          ),
        ),
        body: Observer(
          builder: (_) => ListView.separated(
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                final contact = list.favoriteContacts[index];

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
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetalhesDoContato(contact: contact),
                    ));
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: list.favoriteContacts.length),
        ));
  }
}
