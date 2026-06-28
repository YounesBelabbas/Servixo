import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// تعريف الـ Enum الخاص بالأدوار ليتوافق تماماً مع قاعدة البيانات
enum UserRole {
  @JsonValue('client')
  client,
  @JsonValue('provider')
  provider,
  @JsonValue('admin')
  admin,
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @Default(UserRole.client) UserRole role,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _UserModel;

  // دالة تحويل الخريطة القادمة من Supabase إلى كائن (Object) في فلوتر
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}