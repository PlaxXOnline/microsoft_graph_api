import 'package:json_annotation/json_annotation.dart';

part 'bucket_model.g.dart';

/// Represents a bucket (column) in a plan in Microsoft Planner.
/// 
/// A bucket serves as a container for tasks and helps organize them within a plan.
@JsonSerializable()
class PlannerBucket {
  /// The unique identifier of the bucket.
  final String? id;
  
  /// The name of the bucket.
  final String? name;
  
  /// The ID of the plan to which the bucket belongs.
  final String? planId;
  
  /// The order hint used to determine the placement of the bucket in the plan.
  final String? orderHint;
  
  /// Creates a new PlannerBucket instance.
  PlannerBucket({
    this.id,
    this.name,
    this.planId,
    this.orderHint,
  });
  
  /// Creates a PlannerBucket instance from JSON data.
  factory PlannerBucket.fromJson(Map<String, dynamic> json) => 
      _$PlannerBucketFromJson(json);
      
  /// Converts this PlannerBucket instance to JSON data.
  Map<String, dynamic> toJson() => _$PlannerBucketToJson(this);
}

/// Request model for creating a new bucket.
@JsonSerializable(createFactory: false)
class BucketCreateRequest {
  /// The name of the bucket.
  final String name;
  
  /// The ID of the plan to which the bucket belongs.
  final String planId;
  
  /// The order hint used to determine the placement of the bucket in the plan.
  final String? orderHint;
  
  /// Creates a new BucketCreateRequest instance.
  BucketCreateRequest({
    required this.name,
    required this.planId,
    this.orderHint,
  });
  
  /// Converts this BucketCreateRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$BucketCreateRequestToJson(this);
}

/// Request model for updating a bucket.
@JsonSerializable(createFactory: false)
class BucketUpdateRequest {
  /// The new name of the bucket.
  final String? name;
  
  /// The new order hint for the bucket.
  final String? orderHint;
  
  /// Creates a new BucketUpdateRequest instance.
  BucketUpdateRequest({
    this.name,
    this.orderHint,
  });
  
  /// Converts this BucketUpdateRequest instance to JSON data.
  Map<String, dynamic> toJson() => _$BucketUpdateRequestToJson(this);
}
