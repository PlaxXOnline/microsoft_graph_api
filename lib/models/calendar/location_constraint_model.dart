import 'calendar_models.dart';

class LocationConstraint {
  bool? isRequired;
  bool? suggestLocation;
  List<Location?>? locations;

  LocationConstraint({this.isRequired, this.suggestLocation, this.locations});

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

  Map<String, dynamic> toJson() {
    return {
      'isRequired': isRequired,
      'suggestLocation': suggestLocation,
      'locations': locations?.map((e) => e?.toJson()).toList(),
    };
  }
}
