import 'calendar_models.dart';

class Attendee {
  final String? type;
  final Status? status;
  final EmailAddress? emailAddress;

  Attendee({this.type, this.status, this.emailAddress});

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      type: json['type'],
      status: Status.fromJson(json['status']),
      emailAddress: EmailAddress.fromJson(json['emailAddress']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'status': status?.toJson(),
      'emailAddress': emailAddress?.toJson(),
    };
  }
}
