import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  RatingModel({
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
