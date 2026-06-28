import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'provider_id') required String providerId,
    @JsonKey(name: 'service_id') required String serviceId,
    required String status, // pending, accepted, completed, cancelled
    @JsonKey(name: 'booking_date') required DateTime bookingDate,
    @JsonKey(name: 'total_price') required double totalPrice,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModel.fromJson(json);
}