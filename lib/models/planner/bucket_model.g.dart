// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannerBucket _$PlannerBucketFromJson(Map<String, dynamic> json) =>
    PlannerBucket(
      id: json['id'] as String?,
      name: json['name'] as String?,
      planId: json['planId'] as String?,
      orderHint: json['orderHint'] as String?,
    );

Map<String, dynamic> _$PlannerBucketToJson(PlannerBucket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'planId': instance.planId,
      'orderHint': instance.orderHint,
    };

Map<String, dynamic> _$BucketCreateRequestToJson(
        BucketCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'planId': instance.planId,
      'orderHint': instance.orderHint,
    };

Map<String, dynamic> _$BucketUpdateRequestToJson(
        BucketUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'orderHint': instance.orderHint,
    };
