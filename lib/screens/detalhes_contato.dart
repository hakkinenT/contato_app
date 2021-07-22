import 'package:contato_app/stores/contato.dart';
import 'package:contato_app/stores/contato_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var list = Provider.of<ContactList>(context);

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
                      height: 300,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.blueAccent.withAlpha(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              widget.contact.name,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                '+55 ${widget.contact.phoneNumber}',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              )),
                          Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                widget.contact.email,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              )),
                          Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                widget.contact.contactCategory,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
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
}
