import 'package:contato_app/models/contato.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalhesDoContato extends StatefulWidget {
  final Contact contact;
  const DetalhesDoContato({Key? key, required this.contact}) : super(key: key);

  @override
  _DetalhesDoContatoState createState() => _DetalhesDoContatoState();
}

class _DetalhesDoContatoState extends State<DetalhesDoContato> {
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.contact.isFavorite = !isFavorite;
                    isFavorite = !isFavorite;
                  });
                },
                icon: widget.contact.isFavorite
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border))
          ],
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Material(
                    elevation: 8,
                    child: Container(
                      alignment: Alignment.center,
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[50],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 18.0),
                            child: Text(
                              widget.contact.name,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '+55 ${widget.contact.phoneNumber}',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _fazerLigacao(
                                            widget.contact.phoneNumber);
                                      },
                                      icon: Icon(
                                        Icons.phone_android,
                                        color: Colors.green[600],
                                        size: 30.0,
                                      ))
                                ],
                              )),
                          Divider(),
                          Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    widget.contact.email,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _enviarEmail(widget.contact.email);
                                      },
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.deepOrange[400],
                                        size: 30.0,
                                      ))
                                ],
                              )),
                          Divider(),
                          Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    widget.contact.contactCategory,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  widget.contact.contactCategory == 'Amigos'
                                      ? Icon(
                                          Icons.people_alt,
                                          color: Colors.deepPurpleAccent[700],
                                          size: 30.0,
                                        )
                                      : widget.contact.contactCategory ==
                                              'Trabalho'
                                          ? Icon(
                                              Icons.work,
                                              color: Colors.teal[800],
                                              size: 30.0,
                                            )
                                          : Icon(
                                              Icons.account_balance,
                                              color: Colors.pinkAccent,
                                              size: 30.0,
                                            )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Theme.of(context).accentColor,
                      child: Text(
                        '${widget.contact.name[0]}',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  _fazerLigacao(String phone) async {
    if (await canLaunch("tel:$phone")) {
      await launch("tel:$phone");
    } else {
      throw 'Não foi possível ligar para $phone';
    }
  }

  _enviarEmail(String email) async {
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Não é possível enviar um email para $email';
    }
  }
}
