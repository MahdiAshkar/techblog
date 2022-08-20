import 'package:flutter/material.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/view/profile_screen.dart';
import 'home_screen.dart';
import '../components/my_colors.dart';
import '../components/my_string.dart';
import '../components/my_component.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: Drawer(
              backgroundColor: SolidColors.scaffoldBg,
              child: Padding(
                padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
                child: ListView(
                  children: [
                    DrawerHeader(
                        child: Image.asset(
                      Assets.images.logo.path,
                      scale: 3,
                    )),
                    TechDivider(
                      size: size,
                      padding: false,
                    ),
                    ListTile(
                      title: Text(
                        MyStrings.profileUser,
                        style: textTheme.headline4,
                      ),
                      onTap: () {},
                    ),
                    TechDivider(
                      size: size,
                      padding: false,
                    ),
                    ListTile(
                      title: Text(
                        MyStrings.aboutTechBlog,
                        style: textTheme.headline4,
                      ),
                      onTap: () {},
                    ),
                    TechDivider(
                      size: size,
                      padding: false,
                    ),
                    ListTile(
                      title: Text(
                        MyStrings.shareTechBlog,
                        style: textTheme.headline4,
                      ),
                      onTap: () {},
                    ),
                    TechDivider(
                      size: size,
                      padding: false,
                    ),
                    ListTile(
                      title: Text(
                        MyStrings.gitHubTechBlog,
                        style: textTheme.headline4,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              )),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
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
            scrolledUnderElevation: selectedPageIndex == 0 ? 25 : 0,
          ),
          backgroundColor: SolidColors.scaffoldBg,
          body: Stack(
            children: [
              Positioned.fill(
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
      bottom: 8,
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
