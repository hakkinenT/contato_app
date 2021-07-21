import 'package:flutter/material.dart';

class TermosDeUso extends StatelessWidget {
  const TermosDeUso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Termos e Condições de Uso',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: RichText(
            text: TextSpan(
                text: 'Termos e Condições de Uso\n\n',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                children: [
                  TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur posuere quis massa vitae hendrerit. Mauris scelerisque bibendum porttitor. Proin ut sagittis lorem, sed feugiat eros. Nunc aliquet ante nulla, non venenatis dolor hendrerit ut. Pellentesque hendrerit lacinia est ut placerat. Vivamus eu dolor dolor.\n\n',
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.8,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Sed enim sem, bibendum nec efficitur at, bibendum non ipsum. Donec dapibus lobortis felis vel aliquam. Ut ut lectus vel odio congue pellentesque quis at augue. Donec ornare ultrices nulla vitae rutrum. Aliquam erat volutpat. Vivamus sit amet ligula eget erat sagittis venenatis quis et ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.8,
                    ),
                  )
                ]),
          ),
        ));
  }
}
