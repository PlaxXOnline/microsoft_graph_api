import 'calendar_models.dart';

/// Represents a location constraint for a calendar event.
///
/// Each instance holds a boolean flag indicating if the location is required,
/// a flag suggesting a location, and a list of possible [Location] instances.
class LocationConstraint {
  /// Indicates whether a location is required for the event.
  final bool? isRequired;

  /// Suggests a location for the event.
  final bool? suggestLocation;

  /// The list of possible [Location] instances for the event.
  final List<Location?>? locations;

  /// Creates a new instance of [LocationConstraint].
  ///
  /// All parameters are optional.
  LocationConstraint({this.isRequired, this.suggestLocation, this.locations});

  /// Creates a new instance of [LocationConstraint] from a JSON object.
  ///
  /// The JSON object should contain keys that correspond to the parameters of [LocationConstraint].
  factory LocationConstraint.fromJson(Map<String, dynamic> json) {
    return LocationConstraint(
      isRequired: json['isRequired'],
      suggestLocation: json['suggestLocation'],
      locations: (json['locations'] as List)
          .map((e) =>
              e == null ? null : Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts this [LocationConstraint] object to a JSON object.
  ///
  /// Each parameter of [LocationConstraint] corresponds to a key in the resulting JSON object.
  Map<String, dynamic> toJson() {
    return {
      'isRequired': isRequired,
      'suggestLocation': suggestLocation,
      'locations': locations?.map((e) => e?.toJson()).toList(),
    };
  }
}
