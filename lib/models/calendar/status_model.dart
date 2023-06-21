class Status {
  final String? response;
  final String? time;

  Status({this.response, this.time});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      response: json['response'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response': response,
      'time': time,
    };
  }
}
