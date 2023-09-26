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
      child: CustomScrollView(
        slivers: [
          renderTop(),
          renderLabel(),
          renderProducts(),
        ],
      ),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: ProductCard(),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop() {
    return SliverToBoxAdapter(
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
        ],
      ),
    );
  }
}
