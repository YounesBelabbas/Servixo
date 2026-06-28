import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required int id,
    @JsonKey(name: 'wallet_id') required String walletId,
    required double amount,
    required String type, // deposit, withdrawal, payment
    required String description,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}