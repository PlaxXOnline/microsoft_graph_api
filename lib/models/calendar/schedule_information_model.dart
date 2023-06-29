import 'calendar_models.dart';

/// Represents the schedule information for an individual or a resource.
///
/// Each instance holds information about the schedule ID, availability view, schedule items, and working hours.
class ScheduleInformation {
  /// The identifier for the schedule.
  final String? scheduleId;

  /// A string representing the availability view of the calendar.
  final String? availabilityView;

  /// A list of [ScheduleItem] objects representing the items on the schedule.
  final List<ScheduleItem>? scheduleItems;

  /// A [WorkingHours] object representing the working hours for the schedule.
  final WorkingHours? workingHours;

  /// Creates a new instance of [ScheduleInformation].
  ///
  /// All parameters are optional.
  ScheduleInformation({
    this.scheduleId,
    this.availabilityView,
    this.scheduleItems,
    this.workingHours,
  });

  /// Creates a new instance of [ScheduleInformation] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [ScheduleInformation].
  factory ScheduleInformation.fromJson(Map<String, dynamic> json) {
    return ScheduleInformation(
      scheduleId: json['scheduleId'],
      availabilityView: json['availabilityView'],
      scheduleItems: json['scheduleItems'] != null
          ? (json['scheduleItems'] as List)
              .map((i) => ScheduleItem.fromJson(i))
              .toList()
          : null,
      workingHours: json['workingHours'] != null
          ? WorkingHours.fromJson(json['workingHours'])
          : null,
    );
  }
}
