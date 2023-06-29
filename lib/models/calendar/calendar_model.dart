import 'calendar_owner_model.dart';

/// Represents a calendar.
///
/// Each instance holds various details about the calendar, such as its ID, name, color,
/// default status, change key, sharing permissions, private item viewing permissions,
/// hex color, editing permissions, allowed online meeting providers, default online meeting provider,
/// tallying responses status, removable status, and owner.
class Calendar {
  /// The ID of the calendar.
  final String id;

  /// The name of the calendar.
  final String name;

  /// The color of the calendar.
  final String color;

  /// Indicates whether this calendar is the default calendar.
  final bool isDefaultCalendar;

  /// The change key of the calendar.
  final String changeKey;

  /// Indicates whether the calendar can be shared.
  final bool canShare;

  /// Indicates whether private items can be viewed in the calendar.
  final bool canViewPrivateItems;

  /// The hex color code of the calendar.
  final String hexColor;

  /// Indicates whether the calendar can be edited.
  final bool canEdit;

  /// The list of online meeting providers that are allowed for the calendar.
  final List<String> allowedOnlineMeetingProviders;

  /// The default online meeting provider for the calendar.
  final String defaultOnlineMeetingProvider;

  /// Indicates whether responses are being tallied for the calendar.
  final bool isTallyingResponses;

  /// Indicates whether the calendar is removable.
  final bool isRemovable;

  /// The owner of the calendar.
  final CalendarOwner owner;

  /// Creates a new instance of [Calendar].
  ///
  /// All parameters are required.
  Calendar({
    required this.id,
    required this.name,
    required this.color,
    required this.isDefaultCalendar,
    required this.changeKey,
    required this.canShare,
    required this.canViewPrivateItems,
    required this.hexColor,
    required this.canEdit,
    required this.allowedOnlineMeetingProviders,
    required this.defaultOnlineMeetingProvider,
    required this.isTallyingResponses,
    required this.isRemovable,
    required this.owner,
  });

  /// Creates a new instance of [Calendar] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [Calendar].
  /// The 'allowedOnlineMeetingProviders' key should map to a list of strings.
  /// The 'owner' key should map to a JSON object that can be converted to a [CalendarOwner] object.
  factory Calendar.fromJson(Map<String, dynamic> json) {
    return Calendar(
      id: json['id'],
      name: json['name'],
      color: json['color'],
      isDefaultCalendar: json['isDefaultCalendar'],
      changeKey: json['changeKey'],
      canShare: json['canShare'],
      canViewPrivateItems: json['canViewPrivateItems'],
      hexColor: json['hexColor'],
      canEdit: json['canEdit'],
      allowedOnlineMeetingProviders:
          json['allowedOnlineMeetingProviders'].cast<String>(),
      defaultOnlineMeetingProvider: json['defaultOnlineMeetingProvider'],
      isTallyingResponses: json['isTallyingResponses'],
      isRemovable: json['isRemovable'],
      owner: CalendarOwner.fromJson(json['owner']),
    );
  }

  /// Converts this [Calendar] object to a JSON object.
  ///
  /// Each parameter of [Calendar] corresponds to a key in the resulting JSON object.
  /// The 'allowedOnlineMeetingProviders' key maps to a list of strings.
  /// The 'owner' key maps to a JSON object obtained from the [CalendarOwner] object.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    data['isDefaultCalendar'] = isDefaultCalendar;
    data['changeKey'] = changeKey;
    data['canShare'] = canShare;
    data['canViewPrivateItems'] = canViewPrivateItems;
    data['hexColor'] = hexColor;
    data['canEdit'] = canEdit;
    data['allowedOnlineMeetingProviders'] = allowedOnlineMeetingProviders;
    data['defaultOnlineMeetingProvider'] = defaultOnlineMeetingProvider;
    data['isTallyingResponses'] = isTallyingResponses;
    data['isRemovable'] = isRemovable;
    data['owner'] = owner.toJson();
    return data;
  }
}
