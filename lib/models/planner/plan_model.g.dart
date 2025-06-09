// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      id: json['id'] as String?,
      title: json['title'] as String?,
      owner: json['owner'] as String?,
      createdDateTime: json['createdDateTime'] as String?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      details: json['details'] == null
          ? null
          : PlanDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'owner': instance.owner,
      'createdDateTime': instance.createdDateTime,
      'lastModifiedDateTime': instance.lastModifiedDateTime,
      'details': instance.details,
    };

PlanDetails _$PlanDetailsFromJson(Map<String, dynamic> json) => PlanDetails(
      description: json['description'] as String?,
      categoryDescriptions:
          (json['categoryDescriptions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      sharedWith: json['sharedWith'] as String?,
      previewType: json['previewType'] as String?,
    );

Map<String, dynamic> _$PlanDetailsToJson(PlanDetails instance) =>
    <String, dynamic>{
      'description': instance.description,
      'categoryDescriptions': instance.categoryDescriptions,
      'lastModifiedDateTime': instance.lastModifiedDateTime,
      'sharedWith': instance.sharedWith,
      'previewType': instance.previewType,
    };

Map<String, dynamic> _$PlanCreateRequestToJson(PlanCreateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'owner': instance.owner,
    };

Map<String, dynamic> _$PlanUpdateRequestToJson(PlanUpdateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

Map<String, dynamic> _$PlanDetailsUpdateRequestToJson(
        PlanDetailsUpdateRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'categoryDescriptions': instance.categoryDescriptions,
      'sharedWith': instance.sharedWith,
      'previewType': instance.previewType,
    };
