import 'package:baker_st_assignment/constants/colors.dart';
import 'package:baker_st_assignment/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  PersistentTabController? _controller;

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    colorScheme: const ColorScheme.dark(),
    // canvasColor: Colors.amber,
    appBarTheme: const AppBarTheme(backgroundColor: black),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
        ),
        title: "Home",
        activeColorPrimary: amber,
        inactiveColorPrimary: white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.settings,
        ),
        title: "Settings",
        activeColorPrimary: amber,
        inactiveColorPrimary: white,
      ),
    ];
  }

  List<Widget> screens() {
    return [
      const DataScreen(),
      const DataScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        Stack(children: [
          PersistentTabView(
            context,
            key: _navigatorKey,
            navBarStyle: NavBarStyle.style3,
            navBarHeight: 60,
            controller: _controller,
            screens: screens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.grey.shade900,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: false,
            hideNavigationBarWhenKeyboardShows: true,
            stateManagement: false,
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            onItemSelected: (index) {
              // authController.tabIndex.value = index;
            },
          )
        ]),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
    );
  }
}
