import 'package:contato_app/screens/cadastrar_contato.dart';
import 'package:contato_app/models/contato.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final Contact contact;
  final Function callback;

  const PopupMenu({
    Key? key,
    required this.contact,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlertDialog _alertDialogSucess(Function callback) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        titlePadding: EdgeInsets.all(30),
        title: Column(
          children: [
            Icon(
              Icons.warning,
              size: 50,
              color: Colors.red[700],
            ),
            Text('Cuidado!'),
            Divider(),
            Text(
              'Tem certeza que deseja excluir este contato?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
            )
          ],
        ),
        actionsPadding: EdgeInsets.only(bottom: 10),
        actions: [
          Container(
            height: 35.0,
            width: 110.0,
            child: TextButton(
              child: Text(
                'CANCELAR',
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 17.0),
              ),
              onPressed: () {
                callback(false);
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            height: 35.0,
            width: 100.0,
            child: TextButton(
              child: Text(
                'EXCLUIR',
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 17.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                callback(true);
              },
            ),
          ),
        ],
      );
    }

    return PopupMenuButton(
        iconSize: 30,
        icon: Icon(Icons.more_horiz),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        settings: RouteSettings(arguments: contact),
                        builder: (context) => CadastrarContato()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black54,
                      ),
                      Text(
                        'Editar',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      )
                    ],
                  )),
            ),
            PopupMenuItem(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await showDialog(
                        context: context,
                        builder: (context) => _alertDialogSucess(callback));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.black54,
                      ),
                      Text(
                        'Excluir',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      )
                    ],
                  )),
            ),
          ];
        });
  }
}
