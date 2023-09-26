import 'dart:math';

import 'package:codefac_mid/common/const/data.dart';
import 'package:codefac_mid/restaurant/component/restaurant_card.dart';
import 'package:codefac_mid/restaurant/model/restaurant_model.dart';
import 'package:codefac_mid/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );
    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FutureBuilder(
              future: paginateRestaurant(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index];
                    final pItem = RestaurantModel.fromJson(json: item);
                    // final pItem = RestaurantModel(
                    //   id: item['id'],
                    //   name: item['name'],
                    //   thumbUrl: 'http://$ip${item['thumbUrl']}',
                    //   tags: List<String>.from(item['tags']),
                    //   priceRange: RestaurantPriceRange.values.firstWhere(
                    //     (element) => element.name == item['priceRange'],
                    //   ),
                    //   ratings: item['ratings'],
                    //   ratingsCount: item['ratingsCount'],
                    //   deliveryFee: item['deliveryFee'],
                    // );
                    return GestureDetector(
                      child: RestaurantCard.fromModel(model: pItem),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RestaurantDetailSreen(),
                          ),
                        );
                      },
                    );
                    // return RestaurantCard(
                    //   image: Image.network(
                    //     pItem.thumbUrl,
                    //     fit: BoxFit.cover,
                    //   ),
                    //   name: pItem.name,
                    //   tags: pItem.tags,
                    //   ratingsCount: pItem.ratingsCount,
                    //   deliveryTime: pItem.deliveryTime,
                    //   deliveryFee: pItem.deliveryFee,
                    //   ratings: pItem.ratings,
                    // );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 16,
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              },
            )),
      ),
    );
  }
}
