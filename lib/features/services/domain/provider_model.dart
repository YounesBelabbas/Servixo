import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_model.freezed.dart';
part 'provider_model.g.dart';

@freezed
class ProviderModel with _$ProviderModel {
  const factory ProviderModel({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'category_name') required String categoryName,
    required String wilaya,
    required String commune,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'rating_average') @Default(0.0) double ratingAverage,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
  }) = _ProviderModel;

  factory ProviderModel.fromJson(Map<String, dynamic> json) => _$ProviderModel.fromJson(json);
}