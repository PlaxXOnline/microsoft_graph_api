// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipient _$RecipientFromJson(Map<String, dynamic> json) => Recipient(
      emailAddress: json['emailAddress'] == null
          ? null
          : EmailAddress.fromJson(json['emailAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipientToJson(Recipient instance) => <String, dynamic>{
      'emailAddress': instance.emailAddress,
    };
