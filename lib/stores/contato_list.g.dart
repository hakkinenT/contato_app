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
  Computed<bool>? _$hasFavoriteContactsComputed;

  @override
  bool get hasFavoriteContacts => (_$hasFavoriteContactsComputed ??=
          Computed<bool>(() => super.hasFavoriteContacts,
              name: '_ContactList.hasFavoriteContacts'))
      .value;
  Computed<ObservableList<Contact>>? _$visibleContactsComputed;

  @override
  ObservableList<Contact> get visibleContacts => (_$visibleContactsComputed ??=
          Computed<ObservableList<Contact>>(() => super.visibleContacts,
              name: '_ContactList.visibleContacts'))
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

  final _$filterAtom = Atom(name: '_ContactList.filter');

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$_ContactListActionController = ActionController(name: '_ContactList');

  @override
  void addContacts(Contact contact) {
    final _$actionInfo = _$_ContactListActionController.startAction(
        name: '_ContactList.addContacts');
    try {
      return super.addContacts(contact);
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
  void changeFilter(VisibilityFilter filter) {
    final _$actionInfo = _$_ContactListActionController.startAction(
        name: '_ContactList.changeFilter');
    try {
      return super.changeFilter(filter);
    } finally {
      _$_ContactListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contacts: ${contacts},
filter: ${filter},
favoriteContacts: ${favoriteContacts},
hasFavoriteContacts: ${hasFavoriteContacts},
visibleContacts: ${visibleContacts}
    ''';
  }
}
