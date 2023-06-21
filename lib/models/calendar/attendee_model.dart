class Attendee {
  final String response;
  final String time;
  final String name;
  final String address;

  Attendee({
    required this.response,
    required this.time,
    required this.name,
    required this.address,
  });

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      response: json['status']['response'],
      time: json['status']['time'],
      name: json['emailAddress']['name'],
      address: json['emailAddress']['address'],
    );
  }
}
