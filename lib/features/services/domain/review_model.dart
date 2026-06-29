import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String id,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'provider_id') required String providerId,
    required double rating,
    required String comment,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModel.fromJson(json);
}
