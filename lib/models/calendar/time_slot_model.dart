import 'calendar_models.dart';

class TimeSlot {
  Time? start;
  Time? end;

  TimeSlot({this.start, this.end});

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

  Map<String, dynamic> toJson() {
    return {
      'start': start?.toJson(),
      'end': end?.toJson(),
    };
  }
}
