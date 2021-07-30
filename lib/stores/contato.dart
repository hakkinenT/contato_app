import 'package:mobx/mobx.dart';
part 'contato.g.dart';

class Contact = _Contact with _$Contact;

abstract class _Contact with Store {
  _Contact(
      {this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.contactCategory,
      required this.isFavorite});

  String? id;

  @observable
  String name = "";

  @observable
  String phoneNumber = "";

  @observable
  String email = "";

  @observable
  String? contactCategory;

  @observable
  bool isFavorite = false;

  @action
  void setIsFavorite(bool value) {
    isFavorite = value;
  }
}
