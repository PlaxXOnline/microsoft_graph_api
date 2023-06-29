/// Represents the status of an object.
///
/// Each instance holds a response and a timestamp.
class Status {
  /// The response status.
  final String? response;

  /// The time when the status was updated.
  final String? time;

  /// Creates a new instance of [Status].
  ///
  /// Both parameters are optional.
  Status({this.response, this.time});

  /// Creates a new instance of [Status] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [Status].
  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      response: json['response'],
      time: json['time'],
    );
  }

  /// Converts this [Status] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'response': response,
      'time': time,
    };
  }
}
