import 'calendar_models.dart';

/// Represents an attendee in a calendar event.
///
/// Each instance holds the type of the attendee, the status of the attendee,
/// and the email address of the attendee.
class Attendee {
  /// A string representing the type of the attendee.
  ///
  /// Can be `null` if the attendee type is unknown or not provided.
  final String? type;

  /// A `Status` object representing the status of the attendee.
  ///
  /// Can be `null` if the attendee status is unknown or not provided.
  final Status? status;

  /// An `EmailAddress` object representing the email address of the attendee.
  ///
  /// Can be `null` if the attendee email address is unknown or not provided.
  final EmailAddress? emailAddress;

  /// Creates a new instance of `Attendee`.
  ///
  /// All parameters (`type`, `status`, and `emailAddress`) are optional and can be `null`.
  Attendee({this.type, this.status, this.emailAddress});

  /// Creates a new instance of `Attendee` from a JSON object.
  ///
  /// The JSON object should contain the keys 'type', 'status', and 'emailAddress'.
  /// The 'type' key maps to a string representing the attendee type.
  /// The 'status' key maps to a JSON object that can be converted to a `Status` object.
  /// The 'emailAddress' key maps to a JSON object that can be converted to an `EmailAddress` object.
  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      type: json['type'],
      status: Status.fromJson(json['status']),
      emailAddress: EmailAddress.fromJson(json['emailAddress']),
    );
  }

  /// Converts this `Attendee` object to a JSON object.
  ///
  /// The 'type' key maps to a string representing the attendee type.
  /// The 'status' key maps to a JSON object that represents the `Status` object.
  /// If the `Status` object is `null`, the 'status' key maps to `null`.
  /// The 'emailAddress' key maps to a JSON object that represents the `EmailAddress` object.
  /// If the `EmailAddress` object is `null`, the 'emailAddress' key maps to `null`.
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'status': status?.toJson(),
      'emailAddress': emailAddress?.toJson(),
    };
  }
}
