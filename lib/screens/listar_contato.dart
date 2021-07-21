import 'package:contato_app/screens/cadastrar_contato.dart';
import 'package:contato_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class ListarContato extends StatelessWidget {
  const ListarContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView.separated(
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Nome do contato'),
              subtitle: Text('(79) 9999-9999'),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Text(
                  'U',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10),
    );
  }
}
