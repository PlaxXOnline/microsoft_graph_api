/// Represents a specific point in time, with an associated time zone.
///
/// This is typically used to specify the start or end time of an event.
class Time {
  /// The date and time, in ISO 8601 format.
  ///
  /// This should be a string in the format "yyyy-MM-ddTHH:mm:ss", e.g. "2023-06-30T15:30:00" for June 30, 2023 at 3:30pm.
  final String? dateTime;

  /// The time zone in which the date and time are specified.
  ///
  /// This should be a string representing a valid time zone, e.g. "America/Los_Angeles" for Pacific Time.
  final String? timeZone;

  /// Creates a new instance of [Time].
  ///
  /// Both parameters are optional.
  Time({this.dateTime, this.timeZone});

  /// Creates a new instance of [Time] from a JSON object.
  ///
  /// The JSON object should contain keys "dateTime" and "timeZone" that correspond to the parameters of [Time].
  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      dateTime: json['dateTime'],
      timeZone: json['timeZone'],
    );
  }

  /// Converts this [Time] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'timeZone': timeZone,
    };
  }
}
