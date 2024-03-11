// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRespons _$BaseResponsFromJson(Map<String, dynamic> json) => BaseRespons()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponsToJson(BaseRespons instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomerRespons _$CustomerResponsFromJson(Map<String, dynamic> json) =>
    CustomerRespons(
      json['id'] as String?,
      json['name'] as String?,
      json['nunOFNotiFicattons'] as String?,
    );

Map<String, dynamic> _$CustomerResponsToJson(CustomerRespons instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nunOFNotiFicattons': instance.nunOFNotiFicattons,
    };

ContactRespons _$ContactResponsFromJson(Map<String, dynamic> json) =>
    ContactRespons(
      json['phone'] as String?,
      json['email'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactResponsToJson(ContactRespons instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthRespons _$AuthResponsFromJson(Map<String, dynamic> json) => AuthRespons(
      json['customer '] == null
          ? null
          : CustomerRespons.fromJson(json['customer '] as Map<String, dynamic>),
      json['contact'] == null
          ? null
          : ContactRespons.fromJson(json['contact'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthResponsToJson(AuthRespons instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer ': instance.customerRespons,
      'contact': instance.contactRespons,
    };
