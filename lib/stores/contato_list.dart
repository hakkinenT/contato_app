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

  @action
  void updateContact(Contact contact) {
    int index = contacts.indexOf(contact);

    if (index == -1) {
      return;
    }

    contacts[index].name = contact.name;
    contacts[index].email = contact.email;
    contacts[index].phoneNumber = contact.phoneNumber;
    contacts[index].contactCategory = contact.contactCategory;
    contacts[index].isFavorite = contact.isFavorite;
  }

  @override
  String toString() {
    return contacts.toString();
  }
}
