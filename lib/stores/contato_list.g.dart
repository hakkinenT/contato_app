// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactList on _ContactList, Store {
  Computed<ObservableList<Contact>>? _$favoriteContactsComputed;

  @override
  ObservableList<Contact> get favoriteContacts =>
      (_$favoriteContactsComputed ??= Computed<ObservableList<Contact>>(
              () => super.favoriteContacts,
              name: '_ContactList.favoriteContacts'))
          .value;

  final _$contactsAtom = Atom(name: '_ContactList.contacts');

  @override
  ObservableList<Contact> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(ObservableList<Contact> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  final _$_ContactListActionController = ActionController(name: '_ContactList');

  @override
  void addContacts(ContactModel contactModel) {
    final _$actionInfo = _$_ContactListActionController.startAction(
        name: '_ContactList.addContacts');
    try {
      return super.addContacts(contactModel);
    } finally {
      _$_ContactListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeContact(Contact contact) {
    final _$actionInfo = _$_ContactListActionController.startAction(
        name: '_ContactList.removeContact');
    try {
      return super.removeContact(contact);
    } finally {
      _$_ContactListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateContact(ContactModel contactModel) {
    final _$actionInfo = _$_ContactListActionController.startAction(
        name: '_ContactList.updateContact');
    try {
      return super.updateContact(contactModel);
    } finally {
      _$_ContactListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contacts: ${contacts},
favoriteContacts: ${favoriteContacts}
    ''';
  }
}
