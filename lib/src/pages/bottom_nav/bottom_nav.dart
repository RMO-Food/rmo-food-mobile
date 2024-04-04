import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/bloc/authentication/authentication_cubit.dart';
import 'package:rmo_food/config/routes_imports.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:rmo_food/src/pages/drawer/drawer.dart';
import 'package:rmo_food/src/pages/end_drawer/end_drawer.dart';
import 'package:rmo_food/src/pages/services/cafe/presentation/cafe.dart';
import 'package:rmo_food/src/pages/services/checkout/checkout.dart';
import 'package:rmo_food/src/pages/services/home/home.dart';
import 'package:rmo_food/src/pages/services/menu/presentation/menu.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

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

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    pageController = PageController()
      ..addListener(
          () => setState(() => currentIndex = pageController.page!.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (popValue) async {
        await AppWidgetHelper.confirmationDialog(
            context: context, question: "Do you want to exit?");
      },
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationUnAuthenticated) {
            ScaffoldMessenger.of(context).showMaterialBanner(
                const MaterialBanner(
                    content: Text("Unauthenticated"), actions: []));
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: scaffoldKey,
            body: PageView.builder(
                controller: pageController,
                itemCount: screens.length,
                itemBuilder: (context, index) => screens[index]),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Material(
                color: primaryColor,
                shape: const CircleBorder(),
                child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      if (BlocProvider.of<AuthenticationCubit>(context).state
                          is AuthenticationAuthenticated) {
                        Navigator.pushNamed(context, Routes.qrScanner);
                      } else {
                        AppWidgetHelper.showLoginDialog(context: context);
                      }
                    },
                    child: const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.qr_code_scanner,
                            color: Colors.white, size: 45)))),
            drawer: const CustomDrawer(),
            endDrawer: Container(
                margin: const EdgeInsets.all(10),
                child: const CustomEndDrawer()),
            bottomNavigationBar: BottomAppBar(
                padding: EdgeInsets.zero,
                height: 60,
                shape: const CircularNotchedRectangle(),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      handleBottomActiveIcon(
                          onTap: () {
                            currentIndex = 0;
                            pageController.jumpToPage(currentIndex);
                          },
                          icon: Icons.home,
                          label: "Home",
                          color: currentIndex == 0 ? primaryColor : null),
                      handleBottomActiveIcon(
                          onTap: () {
                            currentIndex = 1;
                            pageController.jumpToPage(currentIndex);
                          },
                          icon: Icons.restaurant_rounded,
                          label: "Cafe",
                          color: currentIndex == 1 ? primaryColor : null),
                      const SizedBox(),
                      handleBottomActiveIcon(
                          onTap: () {
                            currentIndex = 2;
                            pageController.jumpToPage(currentIndex);
                          },
                          icon: Icons.menu_book,
                          label: "Menu",
                          color: currentIndex == 2 ? primaryColor : null),
                      handleBottomActiveIcon(
                          onTap: () =>
                              scaffoldKey!.currentState!.openEndDrawer(),
                          icon: Icons.view_module_rounded,
                          label: "More",
                          color: currentIndex == 3 ? primaryColor : null)
                    ]))),
      ),
    );
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
          Icon(size: 23, icon, color: color ?? Colors.grey.shade500),
          Text(label, style: TextStyle(color: color ?? Colors.grey.shade500))
        ]));
  }
}
