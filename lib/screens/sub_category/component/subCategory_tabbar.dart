import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/generated/local_keys.dart';
import 'package:shop_app/screens/products_list/componnent/productList.dart';
import 'package:easy_localization/easy_localization.dart';

class SubCategoryTab extends StatefulWidget {
  @override
  _SubCategoryTabState createState() => _SubCategoryTabState();
}

class _SubCategoryTabState extends State<SubCategoryTab>
    with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: LocalKeys.FEATURED.tr()),
    new Tab(text: LocalKeys.POPULAR.tr()),
    new Tab(text: LocalKeys.LATEST.tr())
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TabBar(
          isScrollable: true,
          unselectedLabelColor: Theme.of(context).cardColor,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BubbleTabIndicator(
            indicatorHeight: 25.0,
            indicatorColor: kPrimaryColor,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          tabs: tabs,
          controller: _tabController,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: TabBarView(controller: _tabController, children: [
            ListView(
              shrinkWrap: true,
              children: [ProductListData()],
            ),
            ListView(
              shrinkWrap: true,
              children: [ProductListData()],
            ),
            ListView(
              shrinkWrap: true,
              children: [ProductListData()],
            ),
          ]),
        ),
      ],
    );
  }
}
