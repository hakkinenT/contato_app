// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Contact on _Contact, Store {
  final _$nameAtom = Atom(name: '_Contact.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_Contact.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$emailAtom = Atom(name: '_Contact.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$contactCategoryAtom = Atom(name: '_Contact.contactCategory');

  @override
  String? get contactCategory {
    _$contactCategoryAtom.reportRead();
    return super.contactCategory;
  }

  @override
  set contactCategory(String? value) {
    _$contactCategoryAtom.reportWrite(value, super.contactCategory, () {
      super.contactCategory = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: '_Contact.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  final _$_ContactActionController = ActionController(name: '_Contact');

  @override
  void setIsFavorite(bool value) {
    final _$actionInfo =
        _$_ContactActionController.startAction(name: '_Contact.setIsFavorite');
    try {
      return super.setIsFavorite(value);
    } finally {
      _$_ContactActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phoneNumber: ${phoneNumber},
email: ${email},
contactCategory: ${contactCategory},
isFavorite: ${isFavorite}
    ''';
  }
}
