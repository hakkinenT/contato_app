import 'package:nanoid/nanoid.dart';

class ContactModel {
  String? id = nanoid();
  String name;
  String phoneNumber;
  String email;
  String contactCategory;
  bool isFavorite;

  ContactModel(
      {this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.contactCategory,
      this.isFavorite = false});
}
