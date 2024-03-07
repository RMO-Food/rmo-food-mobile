import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/src/pages/cafe/cafe.dart';
import 'package:rmo_food/src/pages/checkout/checkout.dart';
import 'package:rmo_food/src/pages/home/home.dart';
import 'package:rmo_food/src/pages/menu/menu.dart';

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen>
    with TickerProviderStateMixin {
  late final PageController pageController;
  int currentIndex = 0;
  final List<Widget> screens = const <Widget>[
    HomeScreen(),
    CafeScreen(),
    MenuScreen(),
    ChekoutScreen()
  ];
  final List<Widget> bottomNavs = <Widget>[
    Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.home, color: primaryColor), const Text("Home")]),
    Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.home, color: primaryColor), const Text("Cafe")]),
    Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.home, color: primaryColor), const Text("Menu")]),
    Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.home, color: primaryColor),
      const Text("Checkout")
    ])
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            controller: pageController,
            itemCount: screens.length,
            itemBuilder: (context, index) => screens[index]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
            child: CircleAvatar(radius: 35, backgroundColor: primaryColor)),
        bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            height: 60,
            shape: const CircularNotchedRectangle(),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  handleBottomActiveIcon(
                      onTap: () {
                        setState(() {
                          currentIndex = 0;
                          pageController.jumpToPage(currentIndex);
                        });
                      },
                      icon: Icons.home,
                      label: "Home",
                      color: currentIndex == 0 ? primaryColor : null),
                  handleBottomActiveIcon(
                      onTap: () {
                        setState(() {
                          currentIndex = 1;
                          pageController.jumpToPage(currentIndex);
                        });
                      },
                      icon: Icons.restaurant_rounded,
                      label: "Cafe",
                      color: currentIndex == 1 ? primaryColor : null),
                  const SizedBox(),
                  handleBottomActiveIcon(
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                          pageController.jumpToPage(currentIndex);
                        });
                      },
                      icon: Icons.menu_book,
                      label: "Menu",
                      color: currentIndex == 2 ? primaryColor : null),
                  handleBottomActiveIcon(
                      onTap: () {
                        setState(() {
                          currentIndex = 3;
                          pageController.jumpToPage(currentIndex);
                        });
                      },
                      icon: Icons.shopping_cart_checkout,
                      label: "Cart",
                      color: currentIndex == 3 ? primaryColor : null)
                ])));
  }

  Widget handleBottomActiveIcon(
      {required Function() onTap,
      required IconData icon,
      required String label,
      Color? color}) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(size: 30, icon, color: color ?? Colors.grey.shade500),
          Text(label, style: TextStyle(color: color ?? Colors.grey.shade500))
        ]));
  }
}
