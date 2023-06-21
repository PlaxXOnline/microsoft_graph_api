import 'calendar_models.dart';

class Organizer {
  final EmailAddress? emailAddress;

  Organizer({this.emailAddress});

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      emailAddress: EmailAddress.fromJson(json['emailAddress']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emailAddress': emailAddress?.toJson(),
    };
  }
}
