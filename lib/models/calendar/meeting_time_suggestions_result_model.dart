import 'calendar_models.dart';

class MeetingTimeSuggestionsResult {
  String? context;
  String? emptySuggestionsReason;
  List<MeetingTimeSuggestion?>? meetingTimeSuggestions;

  MeetingTimeSuggestionsResult({
    this.context,
    this.emptySuggestionsReason,
    this.meetingTimeSuggestions,
  });

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

  Map<String, dynamic> toJson() {
    return {
      '@odata.context': context,
      'emptySuggestionsReason': emptySuggestionsReason,
      'meetingTimeSuggestions':
          meetingTimeSuggestions?.map((e) => e?.toJson()).toList(),
    };
  }
}
