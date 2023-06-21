class CalendarOwner {
  final String name;
  final String address;

  CalendarOwner({this.name = '', this.address = ''});

  factory CalendarOwner.fromJson(Map<String, dynamic> json) {
    return CalendarOwner(
      name: json['name'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    return data;
  }
}
