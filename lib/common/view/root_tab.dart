import 'package:codefac_mid/common/const/colors.dart';
import 'package:codefac_mid/common/layout/default_layout.dart';
import 'package:codefac_mid/restaurant/view/restaurant_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '재한 딜리버리',
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.animateTo(index);
          setState(() {});
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined), label: '음식'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: '홈'),
        ],
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const RestaurantScreen(),
          Center(
            child: Container(
              child: const Text('2'),
            ),
          ),
          Center(
            child: Container(
              child: const Text('3'),
            ),
          ),
          Center(
            child: Container(
              child: const Text('4'),
            ),
          )
        ],
      ),
    );
  }
}
