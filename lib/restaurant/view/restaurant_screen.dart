import 'package:codefac_mid/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: RestaurantCard(
              image: Image.asset(
                'asset/img/food/ddeok_bok_gi.jpg',
                fit: BoxFit.cover,
              ),
              name: '떠ㄱ볶이',
              tags: const ['asd', 'asd', 'asd'],
              ratingCount: 133,
              deliveryTime: 13,
              deliveryFee: 2000,
              rating: 4),
        ),
      ),
    );
  }
}
