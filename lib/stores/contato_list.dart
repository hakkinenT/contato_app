import 'package:contato_app/models/contact_model.dart';
import 'package:contato_app/stores/contato.dart';
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
  void addContacts(ContactModel contactModel) {
    final contact = Contact(
        id: contactModel.id,
        name: contactModel.name,
        phoneNumber: contactModel.phoneNumber,
        email: contactModel.email,
        contactCategory: contactModel.contactCategory,
        isFavorite: contactModel.isFavorite);

    contacts.add(contact);

    contacts.sort((a, b) => a.name.compareTo(b.name));
  }

  @action
  void removeContact(Contact contact) {
    if (!contacts.contains(contact)) {
      return;
    }
    contacts.removeWhere((element) => element == contact);
  }

  @action
  void updateContact(ContactModel contactModel) {
    final contact = Contact(
        id: contactModel.id,
        name: contactModel.name,
        phoneNumber: contactModel.phoneNumber,
        email: contactModel.email,
        contactCategory: contactModel.contactCategory,
        isFavorite: contactModel.isFavorite);

    int index = contacts.indexWhere((c) => c.id == contact.id);

    if (index == -1) {
      return;
    }

    contacts[index].name = contactModel.name;
    contacts[index].email = contactModel.email;
    contacts[index].phoneNumber = contactModel.phoneNumber;
    contacts[index].contactCategory = contactModel.contactCategory;
    contacts[index].isFavorite = contactModel.isFavorite;
  }

  @override
  String toString() {
    return contacts.toString();
  }
}
