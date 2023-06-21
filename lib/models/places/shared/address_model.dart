class Address {
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String countryOrRegion;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.countryOrRegion,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      countryOrRegion: json['countryOrRegion'],
    );
  }
}
