import 'package:flutter/material.dart';
import 'package:flutter_demo/core_ui/image/app_image.dart';
import 'package:flutter_demo/features/cart/cart/cart_view.dart';
import 'package:flutter_demo/features/discover/discover/discover_view.dart';
import 'package:flutter_demo/features/home/home/home_view.dart';
import 'package:flutter_demo/features/profile/profile/profile_view.dart';
import 'package:flutter_demo/resources/app_asset.dart';
import 'package:flutter_demo/resources/app_color.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _contentView();
  }

  Widget _contentView() {
    return Scaffold(
      bottomNavigationBar: _tabMenuView(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeView(),
          DiscoverView(),
          CartView(),
          ProfileView(),
        ],
      ),
    );
  }

  Widget _tabMenuView() {
    return Container(
      height: 60,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(color: AppColor.lightGrey, width: 1.5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.transparent,
        tabs: [
          AppImage(
            assets: AppAsset.icTabHome,
            color: _currentIndex == 0 ? AppColor.black : AppColor.grey,
          ),
          AppImage(
            assets: AppAsset.icTabDiscover,
            color: _currentIndex == 1 ? AppColor.black : AppColor.grey,
          ),
          AppImage(
            assets: AppAsset.icTabCart,
            color: _currentIndex == 2 ? AppColor.black : AppColor.grey,
          ),
          AppImage(
            assets: AppAsset.icTabProfile,
            color: _currentIndex == 3 ? AppColor.black : AppColor.grey,
          ),
        ],
      ),
    );
  }
}
