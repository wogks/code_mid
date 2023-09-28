import 'package:codefac_mid/common/const/data.dart';
import 'package:codefac_mid/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'restaurant_model.g.dart';

enum RestaurantPriceRange {
  expensive,
  medium,
  cheap,
}

@JsonSerializable()
class RestaurantModel {
  final String id;
  final String name;
  @JsonKey(fromJson: DataUtils.pathUrl)
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.deliveryTime,
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryFee,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  // factory RestaurantModel.fromJson({required Map<String, dynamic> json}) {
  //   return RestaurantModel(
  //     id: json['id'],
  //     name: json['name'],
  //     thumbUrl: 'http://$ip${json['thumbUrl']}',
  //     tags: List<String>.from(json['tags']),
  //     priceRange: RestaurantPriceRange.values.firstWhere(
  //       (element) => element.name == json['priceRange'],
  //     ),
  //     ratings: json['ratings'],
  //     ratingsCount: json['ratingsCount'],
  //     deliveryFee: json['deliveryFee'],
  //     deliveryTime: json['deliveryTime'],
  //   );
  // }
}
