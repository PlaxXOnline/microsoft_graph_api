import 'calendar_models.dart';

/// Represents the result of a request for meeting time suggestions.
///
/// Each instance holds the OData context, a reason for any empty suggestions,
/// and a list of the suggested meeting times.
class MeetingTimeSuggestionsResult {
  /// The OData context of the result.
  final String? context;

  /// The reason for any empty suggestions, if applicable.
  final String? emptySuggestionsReason;

  /// A list of the suggested meeting times.
  final List<MeetingTimeSuggestion?>? meetingTimeSuggestions;

  /// Creates a new instance of [MeetingTimeSuggestionsResult].
  ///
  /// All parameters are optional.
  MeetingTimeSuggestionsResult({
    this.context,
    this.emptySuggestionsReason,
    this.meetingTimeSuggestions,
  });

  /// Creates a new instance of [MeetingTimeSuggestionsResult] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [MeetingTimeSuggestionsResult].
  factory MeetingTimeSuggestionsResult.fromJson(Map<String, dynamic> json) {
    return MeetingTimeSuggestionsResult(
      context: json['@odata.context'],
      emptySuggestionsReason: json['emptySuggestionsReason'],
      meetingTimeSuggestions: json['meetingTimeSuggestions'] != null
          ? (json['meetingTimeSuggestions'] as List)
              .map((i) => MeetingTimeSuggestion.fromJson(i))
              .toList()
          : null,
    );
  }

  /// Converts this [MeetingTimeSuggestionsResult] object to a JSON object.
  ///
  /// Each parameter of [MeetingTimeSuggestionsResult] corresponds to a key in the resulting JSON object.
  Map<String, dynamic> toJson() {
    return {
      '@odata.context': context,
      'emptySuggestionsReason': emptySuggestionsReason,
      'meetingTimeSuggestions':
          meetingTimeSuggestions?.map((e) => e?.toJson()).toList(),
    };
  }
}
