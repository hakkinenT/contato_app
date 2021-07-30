import 'package:contato_app/screens/cadastrar_contato.dart';
import 'package:contato_app/screens/listar_contato.dart';
import 'package:contato_app/stores/contato_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ContactList>(
          create: (_) => ContactList(),
        ),
      ],
      child: MaterialApp(
        title: 'Contatos App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.white,
            accentColor: Colors.blueAccent[700],
            iconTheme: IconThemeData(
              color: Colors.blueAccent[700],
            ),
            appBarTheme: AppBarTheme(
                centerTitle: true,
                actionsIconTheme: IconThemeData(
                  color: Colors.blueAccent[700],
                ),
                iconTheme: IconThemeData(
                  color: Colors.blueAccent[700],
                ),
                titleTextStyle: TextStyle(color: Colors.blueAccent[700]))),
        //home: ListarContato(),
        routes: {
          '/': (_) => ListarContato(),
          '/cadastrar_contato': (_) => CadastrarContato()
        },
      ),
    );
  }
}
