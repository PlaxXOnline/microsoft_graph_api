import 'calendar_models.dart';

/// Represents a period of time, with a start and an end.
///
/// This is typically used to specify the duration of an event, or a possible time slot for an event.
class TimeSlot {
  /// The start time of the slot.
  ///
  /// This should be an instance of [Time], representing the date, time, and time zone of the start of the slot.
  final Time? start;

  /// The end time of the slot.
  ///
  /// This should be an instance of [Time], representing the date, time, and time zone of the end of the slot.
  final Time? end;

  /// Creates a new instance of [TimeSlot].
  ///
  /// Both parameters are optional.
  TimeSlot({this.start, this.end});

  /// Creates a new instance of [TimeSlot] from a JSON object.
  ///
  /// The JSON object should contain keys "start" and "end" that correspond to the parameters of [TimeSlot].
  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      start: json['start'] == null
          ? null
          : Time.fromJson(json['start'] as Map<String, dynamic>),
      end: json['end'] == null
          ? null
          : Time.fromJson(json['end'] as Map<String, dynamic>),
    );
  }

  /// Converts this [TimeSlot] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'start': start?.toJson(),
      'end': end?.toJson(),
    };
  }
}
