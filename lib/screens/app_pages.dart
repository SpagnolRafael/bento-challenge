import 'package:bento_challenge/screens/account/account_screen.dart';
import 'package:bento_challenge/screens/cart/cart_screen.dart';
import 'package:bento_challenge/screens/delas/delas_screen.dart';
import 'package:bento_challenge/screens/home/home_screen.dart';
import 'package:bento_challenge/screens/shop/shop_screen.dart';
import 'package:bento_challenge/services/app_tutorial.dart';
import 'package:bento_challenge/shareds/app_bottom_nav_bar.dart';
import 'package:bento_challenge/shareds/app_scaffold.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ionicons/ionicons.dart';

class AppPages extends StatefulWidget {
  const AppPages({super.key});

  @override
  State<AppPages> createState() => _AppPagesState();
}

class _AppPagesState extends State<AppPages> {
  late ScrollController _scrollController;
  late PageController _pageController;
  bool _isVisible = true;
  int _selectedIndex = 0;
  List<Widget> _pages = [];
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _pageController = PageController();
    _scrollController.addListener(_scrollListener);
    _pages = [
      HomeScreen(controller: _scrollController),
      const DelasScreen(),
      const ShopScreen(),
      const CartScreen(),
      const AccountScreen(),
    ];
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _pages[index],
        controller: _pageController,
      ),
      bottomNavigationBar: AnimatedPositioned(
        key: AppTutorial.gKeyNavBar,
        duration: const Duration(milliseconds: 300),
        bottom: _isVisible ? 0 : -150,
        left: 0,
        right: 0,
        child: Column(
          children: [
            AppBottomNavBar(
              barHeight: 55,
              domeCircleSize: 50,
              domeCircleColor: AppColors.blue800,
              domeHeight: 20,
              tabs: [
                AppNavBarItem(icon: const Icon(Icons.home), title: 'Home'),
                AppNavBarItem(
                    icon: const Icon(Ionicons.pricetag), title: 'Delas'),
                AppNavBarItem(icon: const Icon(Icons.store), title: 'Shop'),
                AppNavBarItem(icon: const Icon(Ionicons.bag), title: 'Cart'),
                AppNavBarItem(
                    icon: const Icon(Ionicons.person), title: 'Account'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                _pageController.jumpToPage(_selectedIndex);
              },
            ),
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).padding.bottom)
          ],
        ),
      ),
    );
  }
}
