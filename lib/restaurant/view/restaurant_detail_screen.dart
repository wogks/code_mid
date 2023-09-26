import 'package:codefac_mid/common/layout/default_layout.dart';
import 'package:codefac_mid/product/component/product_card.dart';
import 'package:codefac_mid/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantDetailSreen extends StatelessWidget {
  const RestaurantDetailSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '부ㄹ타는 떡ㅗㄲ이',
      child: Column(
        children: [
          RestaurantCard(
            image: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
            name: 'name',
            tags: const ['asd', 'asd'],
            ratingsCount: 12,
            deliveryTime: 22,
            deliveryFee: 2222,
            ratings: 4.3,
            isDetail: true,
            detail: '맛있는 덕볶이',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ProductCard(),
          ),
        ],
      ),
    );
  }
}
