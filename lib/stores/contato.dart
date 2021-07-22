class Contact {
  String name;
  String phoneNumber;
  String email;
  String contactCategory;
  bool isFavorite;

  Contact(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.contactCategory,
      this.isFavorite = false});
}
