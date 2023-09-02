import 'package:json_annotation/json_annotation.dart';

part 'product_color.g.dart';

@JsonSerializable()
class ProductColor {
  String? hexValue;
  String? colourName;

  ProductColor({this.hexValue, this.colourName});

  factory ProductColor.fromJson(Map<String, dynamic> json) =>
      _$ProductColorFromJson(json);

  Map<String, dynamic> toJson() => _$ProductColorToJson(this);
}
