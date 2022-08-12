import 'package:flutter/material.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/my_colors.dart';
import 'package:tecblog/view/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Image.asset(
                  Assets.images.logo.path,
                  height: size.height / 13.6,
                ),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ],
            ),
            backgroundColor: SolidColors.scaffoldBg,
            elevation: 0,
            scrolledUnderElevation: 24,
          ),
          backgroundColor: SolidColors.scaffoldBg,
          body: Stack(
            children: [
              Center(
                child: Positioned.fill(
                  child: IndexedStack(
                    index: selectedPageIndex,
                    children: [
                      HomeScreen(
                          size: size,
                          textTheme: textTheme,
                          bodyMargin: bodyMargin),
                      ProfileScreen(
                          size: size,
                          textTheme: textTheme,
                          bodyMargin: bodyMargin),
                    ],
                  ),
                ),
              ),
              BackgroundBottomNav(size: size),
              BottomNav(
                bodyMargin: bodyMargin,
                size: size,
                changScreen: (int value) {
                  setState(() {
                    selectedPageIndex = value;
                  });
                },
              )
            ],
          )),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
    required this.bodyMargin,
    required this.size,
    required this.changScreen,
  }) : super(key: key);

  final double bodyMargin;
  final Size size;
  final Function(int) changScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: bodyMargin,
      left: bodyMargin,
      child: Container(
        height: size.height / 12.3,
        width: size.width / 1.3,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              colors: GradiantColors.bottomNav,
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () => changScreen(0),
                icon: ImageIcon(
                  AssetImage(Assets.icons.home.path),
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(Assets.icons.write.path),
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () => changScreen(1),
                icon: ImageIcon(
                  AssetImage(Assets.icons.user.path),
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}

class BackgroundBottomNav extends StatelessWidget {
  const BackgroundBottomNav({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 5.8,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradiantColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
