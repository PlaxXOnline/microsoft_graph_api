import 'calendar_models.dart';

/// Represents an item on a schedule.
///
/// Each instance holds information about the privacy setting, status, subject, location, start time, and end time of the item.
class ScheduleItem {
  /// Indicates whether the item is private.
  final bool? isPrivate;

  /// The status of the item.
  final String? status;

  /// The subject of the item.
  final String? subject;

  /// The location of the item.
  final String? location;

  /// The start time of the item as a [Time] object.
  final Time? start;

  /// The end time of the item as a [Time] object.
  final Time? end;

  /// Creates a new instance of [ScheduleItem].
  ///
  /// All parameters are optional.
  ScheduleItem({
    this.isPrivate,
    this.status,
    this.subject,
    this.location,
    this.start,
    this.end,
  });

  /// Creates a new instance of [ScheduleItem] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [ScheduleItem].
  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      isPrivate: json['isPrivate'],
      status: json['status'],
      subject: json['subject'],
      location: json['location'],
      start: json['start'] != null ? Time.fromJson(json['start']) : null,
      end: json['end'] != null ? Time.fromJson(json['end']) : null,
    );
  }
}
