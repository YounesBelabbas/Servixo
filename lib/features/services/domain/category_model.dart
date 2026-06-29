import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name, // اسم الفئة (مثلا: Plomberie, Electricité)
    @JsonKey(name: 'icon_url') String? iconUrl, // أيقونة الفئة
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModel.fromJson(json);
}