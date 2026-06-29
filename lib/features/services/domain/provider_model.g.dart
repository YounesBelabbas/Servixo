// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderModelImpl _$$ProviderModelImplFromJson(Map<String, dynamic> json) =>
    _$ProviderModelImpl(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      categoryName: json['category_name'] as String,
      wilaya: json['wilaya'] as String,
      commune: json['commune'] as String,
      phoneNumber: json['phone_number'] as String,
      avatarUrl: json['avatar_url'] as String?,
      ratingAverage: (json['rating_average'] as num?)?.toDouble() ?? 0.0,
      isAvailable: json['is_available'] as bool? ?? true,
    );

Map<String, dynamic> _$$ProviderModelImplToJson(_$ProviderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'category_name': instance.categoryName,
      'wilaya': instance.wilaya,
      'commune': instance.commune,
      'phone_number': instance.phoneNumber,
      'avatar_url': instance.avatarUrl,
      'rating_average': instance.ratingAverage,
      'is_available': instance.isAvailable,
    };
