/// Represents a time zone.
///
/// This is typically used to specify the time zone of an event or of a user's working hours.
class TimeZone {
  /// The alias of the time zone.
  ///
  /// This is usually a standard time zone identifier, such as "UTC" or "America/Los_Angeles".
  final String alias;

  /// The display name of the time zone.
  ///
  /// This is a human-readable string that describes the time zone, such as "Pacific Standard Time".
  final String displayName;

  /// Creates a new instance of [TimeZone].
  ///
  /// Both [alias] and [displayName] must be provided.
  TimeZone({required this.alias, required this.displayName});

  /// Creates a new instance of [TimeZone] from a JSON object.
  ///
  /// The JSON object should contain keys "alias" and "displayName" that correspond to the properties of [TimeZone].
  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      alias: json['alias'],
      displayName: json['displayName'],
    );
  }
}
