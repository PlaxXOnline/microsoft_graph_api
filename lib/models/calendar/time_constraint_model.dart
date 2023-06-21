import 'calendar_models.dart';

class TimeConstraint {
  String? activityDomain;
  List<TimeSlot?>? timeSlots;

  TimeConstraint({this.activityDomain, this.timeSlots});

  factory TimeConstraint.fromJson(Map<String, dynamic> json) {
    return TimeConstraint(
      activityDomain: json['activityDomain'],
      timeSlots: (json['timeSlots'] as List)
          .map((e) =>
              e == null ? null : TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activityDomain': activityDomain,
      'timeSlots': timeSlots?.map((e) => e?.toJson()).toList(),
    };
  }
}
