import 'package:contato_app/models/contato.dart';
import 'package:mobx/mobx.dart';

part 'contato_list.g.dart';

class ContactList = _ContactList with _$ContactList;

abstract class _ContactList with Store {
  @observable
  ObservableList<Contact> contacts = ObservableList();

  @computed
  ObservableList<Contact> get favoriteContacts => ObservableList.of(
      contacts.where((contact) => contact.isFavorite == true));

  @action
  void addContacts(Contact contact) {
    contacts.add(contact);
  }

  @action
  void removeContact(Contact contact) {
    if (!contacts.contains(contact)) {
      return;
    }
    contacts.removeWhere((element) => element == contact);
  }

  @override
  String toString() {
    return contacts.toString();
  }
}
