import 'calendar_models.dart';

/// Represents the working hours of an individual.
///
/// This is typically used to determine availability for scheduling meetings.
class WorkingHours {
  /// A list of the days of the week on which the individual works.
  ///
  /// Each day should be represented as a string, such as "Monday" or "Friday".
  List<String>? daysOfWeek;

  /// The start time of the individual's working day.
  ///
  /// This should be a string representing a time in 24-hour format, such as "09:00".
  String? startTime;

  /// The end time of the individual's working day.
  ///
  /// This should be a string representing a time in 24-hour format, such as "17:00".
  String? endTime;

  /// The time zone in which the individual's working hours are specified.
  TimeZone? timeZone;

  /// Creates a new instance of [WorkingHours].
  WorkingHours({
    this.daysOfWeek,
    this.startTime,
    this.endTime,
    this.timeZone,
  });

  /// Creates a new instance of [WorkingHours] from a JSON object.
  ///
  /// The JSON object should contain keys "daysOfWeek", "startTime", "endTime", and "timeZone" that correspond to the properties of [WorkingHours].
  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    return WorkingHours(
      daysOfWeek: json['daysOfWeek'] != null
          ? List<String>.from(json['daysOfWeek'])
          : null,
      startTime: json['startTime'],
      endTime: json['endTime'],
      timeZone:
          json['timeZone'] != null ? TimeZone.fromJson(json['timeZone']) : null,
    );
  }
}
