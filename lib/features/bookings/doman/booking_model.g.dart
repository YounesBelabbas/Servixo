// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      providerId: json['provider_id'] as String,
      serviceId: json['service_id'] as String,
      status: json['status'] as String,
      bookingDate: DateTime.parse(json['booking_date'] as String),
      totalPrice: (json['total_price'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'provider_id': instance.providerId,
      'service_id': instance.serviceId,
      'status': instance.status,
      'booking_date': instance.bookingDate.toIso8601String(),
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt.toIso8601String(),
    };
