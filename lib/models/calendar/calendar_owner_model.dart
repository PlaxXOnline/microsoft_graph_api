/// Represents the owner of a calendar.
///
/// Each instance holds the name and address of the owner.
class CalendarOwner {
  /// The name of the calendar owner.
  final String name;

  /// The address of the calendar owner.
  final String address;

  /// Creates a new instance of [CalendarOwner].
  ///
  /// Both parameters have default values of an empty string.
  CalendarOwner({this.name = '', this.address = ''});

  /// Creates a new instance of [CalendarOwner] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [CalendarOwner].
  factory CalendarOwner.fromJson(Map<String, dynamic> json) {
    return CalendarOwner(
      name: json['name'],
      address: json['address'],
    );
  }

  /// Converts this [CalendarOwner] object to a JSON object.
  ///
  /// Each parameter of [CalendarOwner] corresponds to a key in the resulting JSON object.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    return data;
  }
}
