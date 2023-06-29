import 'calendar_models.dart';

/// Represents the response to a schedule request.
///
/// Each instance holds the context and a list of [ScheduleInformation].
class ScheduleResponse {
  /// The context of the response, usually a URI.
  final String? context;

  /// The list of [ScheduleInformation] in the response.
  final List<ScheduleInformation>? value;

  /// Creates a new instance of [ScheduleResponse].
  ///
  /// Both parameters are optional.
  ScheduleResponse({this.context, this.value});

  /// Creates a new instance of [ScheduleResponse] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [ScheduleResponse].
  factory ScheduleResponse.fromJson(Map<String, dynamic> json) {
    return ScheduleResponse(
      context: json['@odata.context'],
      value: json['value'] != null
          ? (json['value'] as List)
              .map((i) => ScheduleInformation.fromJson(i))
              .toList()
          : null,
    );
  }
}
