import 'calendar_models.dart';

/// Represents the time constraint of an event or activity.
///
/// Each instance holds an activity domain and a list of time slots.
class TimeConstraint {
  /// The domain of the activity.
  ///
  /// This is typically a string that identifies the type or category of the activity.
  final String? activityDomain;

  /// The list of possible time slots for the activity.
  ///
  /// Each [TimeSlot] object represents a possible window of time in which the activity could take place.
  final List<TimeSlot?>? timeSlots;

  /// Creates a new instance of [TimeConstraint].
  ///
  /// Both parameters are optional.
  TimeConstraint({this.activityDomain, this.timeSlots});

  /// Creates a new instance of [TimeConstraint] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [TimeConstraint].
  factory TimeConstraint.fromJson(Map<String, dynamic> json) {
    return TimeConstraint(
      activityDomain: json['activityDomain'],
      timeSlots: (json['timeSlots'] as List)
          .map((e) =>
              e == null ? null : TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts this [TimeConstraint] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'activityDomain': activityDomain,
      'timeSlots': timeSlots?.map((e) => e?.toJson()).toList(),
    };
  }
}
