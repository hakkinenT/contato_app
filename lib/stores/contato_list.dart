import 'package:contato_app/stores/contato.dart';
import 'package:mobx/mobx.dart';

part 'contato_list.g.dart';

enum VisibilityFilter { all, favorite }

class ContactList = _ContactList with _$ContactList;

abstract class _ContactList with Store {
  @observable
  ObservableList<Contact> contacts = ObservableList();

  @observable
  VisibilityFilter filter = VisibilityFilter.all;

  @computed
  ObservableList<Contact> get favoriteContacts => ObservableList.of(
      contacts.where((contact) => contact.isFavorite == true));

  @computed
  bool get hasFavoriteContacts => favoriteContacts.isNotEmpty;

  @computed
  ObservableList<Contact> get visibleContacts {
    if (filter == VisibilityFilter.favorite) {
      return favoriteContacts;
    }

    return contacts;
  }

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
  void changeFilter(VisibilityFilter filter) => this.filter = filter;

  @override
  String toString() {
    return contacts.toString();
  }
}
