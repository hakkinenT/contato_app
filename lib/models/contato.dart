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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact &&
          runtimeType == other.runtimeType &&
          phoneNumber == other.phoneNumber;

  @override
  int get hashCode => phoneNumber.hashCode;
}
