/// Represents an email address.
///
/// Each instance holds the name associated with the email address and the address itself.
class EmailAddress {
  /// The name associated with the email address.
  final String? name;

  /// The email address.
  final String? address;

  /// Creates a new instance of [EmailAddress].
  ///
  /// Both parameters are optional.
  EmailAddress({this.name, this.address});

  /// Creates a new instance of [EmailAddress] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [EmailAddress].
  factory EmailAddress.fromJson(Map<String, dynamic> json) {
    return EmailAddress(
      name: json['name'],
      address: json['address'],
    );
  }

  /// Converts this [EmailAddress] object to a JSON object.
  ///
  /// Each parameter of [EmailAddress] corresponds to a key in the resulting JSON object.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
    };
  }
}
