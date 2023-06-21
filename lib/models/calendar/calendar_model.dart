import 'calendar_owner_model.dart';

class Calendar {
  final String id;
  final String name;
  final String color;
  final bool isDefaultCalendar;
  final String changeKey;
  final bool canShare;
  final bool canViewPrivateItems;
  final String hexColor;
  final bool canEdit;
  final List<String> allowedOnlineMeetingProviders;
  final String defaultOnlineMeetingProvider;
  final bool isTallyingResponses;
  final bool isRemovable;
  final CalendarOwner owner;

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
