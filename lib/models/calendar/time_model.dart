class Time {
  String? dateTime;
  String? timeZone;

  Time({this.dateTime, this.timeZone});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      dateTime: json['dateTime'],
      timeZone: json['timeZone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime,
      'timeZone': timeZone,
    };
  }
}
