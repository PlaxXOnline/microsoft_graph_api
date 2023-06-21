class EmailAddress {
  final String? name;
  final String? address;

  EmailAddress({this.name, this.address});

  factory EmailAddress.fromJson(Map<String, dynamic> json) {
    return EmailAddress(
      name: json['name'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
    };
  }
}
