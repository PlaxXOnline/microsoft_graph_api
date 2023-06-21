class Address {
  String? street;
  String? city;
  String? state;
  String? countryOrRegion;
  String? postalCode;

  Address({
    this.street,
    this.city,
    this.state,
    this.countryOrRegion,
    this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      countryOrRegion: json['countryOrRegion'],
      postalCode: json['postalCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'countryOrRegion': countryOrRegion,
      'postalCode': postalCode,
    };
  }
}
