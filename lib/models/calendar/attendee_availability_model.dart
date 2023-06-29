import 'calendar_models.dart';

/// Represents the availability status of an attendee in a calendar event.
///
/// Each instance holds a string representing the availability status and
/// an `Attendee` object representing the attendee.
class AttendeeAvailability {
  /// A string representing the availability of the attendee.
  ///
  /// Can be `null` if the availability status is unknown or not provided.
  String? availability;

  /// An `Attendee` object representing the attendee.
  ///
  /// Can be `null` if the attendee information is not provided.
  Attendee? attendee;

  /// Creates a new instance of `AttendeeAvailability`.
  ///
  /// Both `availability` and `attendee` are optional parameters and can be `null`.
  AttendeeAvailability({this.availability, this.attendee});

  /// Creates a new instance of `AttendeeAvailability` from a JSON object.
  ///
  /// The JSON object should contain the keys 'availability' and 'attendee'.
  /// The 'availability' key maps to a string representing the availability status.
  /// The 'attendee' key maps to a JSON object that can be converted to an `Attendee` object.
  factory AttendeeAvailability.fromJson(Map<String, dynamic> json) {
    return AttendeeAvailability(
      availability: json['availability'],
      attendee:
          json['attendee'] != null ? Attendee.fromJson(json['attendee']) : null,
    );
  }

  /// Converts this `AttendeeAvailability` object to a JSON object.
  ///
  /// The 'availability' key maps to a string representing the availability status.
  /// The 'attendee' key maps to a JSON object that represents the `Attendee` object.
  /// If the `Attendee` object is `null`, the 'attendee' key maps to `null`.
  Map<String, dynamic> toJson() {
    return {
      'availability': availability,
      'attendee': attendee?.toJson(),
    };
  }
}
