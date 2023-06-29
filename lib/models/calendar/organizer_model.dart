import 'calendar_models.dart';

/// Represents the organizer of an event.
///
/// Each instance holds an [EmailAddress] object representing the email address of the organizer.
class Organizer {
  /// The email address of the organizer.
  final EmailAddress? emailAddress;

  /// Creates a new instance of [Organizer].
  ///
  /// All parameters are optional.
  Organizer({this.emailAddress});

  /// Creates a new instance of [Organizer] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [Organizer].
  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      emailAddress: EmailAddress.fromJson(json['emailAddress']),
    );
  }

  /// Converts this [Organizer] object to a JSON object.
  ///
  /// Each parameter of [Organizer] corresponds to a key in the resulting JSON object.
  Map<String, dynamic> toJson() {
    return {
      'emailAddress': emailAddress?.toJson(),
    };
  }
}
