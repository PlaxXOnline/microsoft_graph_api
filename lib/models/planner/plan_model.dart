import 'package:json_annotation/json_annotation.dart';

part 'plan_model.g.dart';

/// Represents a plan in Microsoft Planner.
/// 
/// A plan is a container for tasks and is associated with a Microsoft 365 Group.
@JsonSerializable()
class Plan {
  /// The unique identifier of the plan.
  final String? id;

  /// The title of the plan.
  final String? title;
  
  /// The ID of the Microsoft 365 Group associated with the plan.
  final String? owner;
  
  /// The date and time when the plan was created.
  final String? createdDateTime;
  
  /// The date and time when the container was last modified.
  final String? lastModifiedDateTime;
  
  /// Additional details about the plan.
  final PlanDetails? details;

  /// Creates a new Plan instance.
  Plan({
    this.id,
    this.title,
    this.owner,
    this.createdDateTime,
    this.lastModifiedDateTime,
    this.details,
  });

  /// Creates a Plan instance from JSON data.
  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  /// Converts this Plan instance to JSON data.
  Map<String, dynamic> toJson() => _$PlanToJson(this);
}

/// Represents detailed information about a plan in Microsoft Planner.
@JsonSerializable()
class PlanDetails {
  /// The description of the plan.
  final String? description;
  
  /// The plan's category descriptions (labels for categories).
  final Map<String, String>? categoryDescriptions;
  
  /// The date and time when the details were last modified.
  final String? lastModifiedDateTime;
  
  /// The ID of the sharing URL for the plan.
  final String? sharedWith;
  
  /// The URL for the plan details.
  final String? previewType;

  /// Creates a new PlanDetails instance.
  PlanDetails({
    this.description,
    this.categoryDescriptions,
    this.lastModifiedDateTime,
    this.sharedWith,
    this.previewType,
  });

  /// Creates a PlanDetails instance from JSON data.
  factory PlanDetails.fromJson(Map<String, dynamic> json) => 
      _$PlanDetailsFromJson(json);

  /// Converts this PlanDetails instance to JSON data.
  Map<String, dynamic> toJson() => _$PlanDetailsToJson(this);
}

/// Request model for creating a new plan.
@JsonSerializable(createFactory: false)
class PlanCreateRequest {
  /// The title of the new plan.
  final String title;
  
  /// The ID of the Microsoft 365 Group that will own the new plan.
  final String owner;

  /// Creates a new PlanCreateRequest instance.
  PlanCreateRequest({
    required this.title,
    required this.owner,
  });

  /// Converts this PlanCreateRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$PlanCreateRequestToJson(this);
}

/// Request model for updating a plan.
@JsonSerializable(createFactory: false)
class PlanUpdateRequest {
  /// The new title of the plan.
  final String? title;

  /// Creates a new PlanUpdateRequest instance.
  PlanUpdateRequest({
    this.title,
  });

  /// Converts this PlanUpdateRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$PlanUpdateRequestToJson(this);
}

/// Request model for updating plan details.
@JsonSerializable(createFactory: false)
class PlanDetailsUpdateRequest {
  /// The description of the plan.
  final String? description;
  
  /// The plan's category descriptions (labels for categories).
  final Map<String, String>? categoryDescriptions;
  
  /// The ID of the sharing URL for the plan.
  final String? sharedWith;
  
  /// The URL for the plan details.
  final String? previewType;

  /// Creates a new PlanDetailsUpdateRequest instance.
  PlanDetailsUpdateRequest({
    this.description,
    this.categoryDescriptions,
    this.sharedWith,
    this.previewType,
  });

  /// Converts this PlanDetailsUpdateRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$PlanDetailsUpdateRequestToJson(this);
}
