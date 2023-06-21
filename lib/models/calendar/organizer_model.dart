class Organizer {
  final String name;
  final String address;

  Organizer({
    required this.name,
    required this.address,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      name: json['emailAddress']['name'],
      address: json['emailAddress']['address'],
    );
  }
}
