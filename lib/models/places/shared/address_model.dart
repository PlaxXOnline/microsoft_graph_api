/// Represents a physical address.
///
/// This class encapsulates various properties of an address, such as its street, city, state, country or region, and postal code.
class Address {
  /// The street name of the address.
  final String? street;

  /// The city of the address.
  final String? city;

  /// The state of the address.
  final String? state;

  /// The country or region of the address.
  final String? countryOrRegion;

  /// The postal code of the address.
  final String? postalCode;

  /// Creates a new instance of [Address].
  Address({
    this.street,
    this.city,
    this.state,
    this.countryOrRegion,
    this.postalCode,
  });

  /// Creates a new instance of [Address] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the properties of [Address].
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      countryOrRegion: json['countryOrRegion'],
      postalCode: json['postalCode'],
    );
  }

  /// Returns a JSON-compatible map that represents this [Address].
  ///
  /// This method can be used when storing this [Address] in a database or sending it over a network.
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
