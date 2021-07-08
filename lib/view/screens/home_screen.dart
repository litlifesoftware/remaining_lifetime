import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lit_ui_kit/lit_ui_kit.dart';
import 'package:remaining_lifetime/controller/lifetime_controller.dart';
import 'package:remaining_lifetime/view/screens/lifetime_screen.dart';
import 'package:remaining_lifetime/view/screens/profile_screen.dart';
import 'package:remaining_lifetime/view/widgets/bottom_bar.dart';

/// The home screen which will be display once the database has been created.
/// Its main purpose is to display the basic elements like the [BottomBar].
/// Furthermore it will contain [Widget]s to interact with and display data
/// provided by the [appSettingsBox] and [goalsBox].
class HomeScreen extends StatefulWidget {
  final Box<dynamic> appSettingsBox;
  final Box<dynamic> goalsBox;
  final LifetimeController? lifetimeController;

  /// Creates a [HomeScreen] [Widget].

  const HomeScreen({
    Key? key,
    required this.appSettingsBox,
    required this.goalsBox,
    required this.lifetimeController,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool hideNavigationBar = false;

  void toggleHideNavigationBar() {
    setState(() {
      hideNavigationBar = !hideNavigationBar;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LitTabView(
      tabItemColorSelected: Color(0xFFFFF4dc),
      hideNavigationBar: hideNavigationBar,
      tabs: [
        LitNavigableTab(
          tabData: LitBottomNavigationTabData(
              index: 0, icon: LitIcons.home_alt, iconSelected: LitIcons.home),
          screen: LifetimeScreen(
            appSettingsBox: widget.appSettingsBox,
            goalsBox: widget.goalsBox,
            lifetimeController: widget.lifetimeController,
            toggleHideNavigationBar: toggleHideNavigationBar,
          ),
        ),
        LitNavigableTab(
          tabData: LitBottomNavigationTabData(
              index: 1,
              icon: LitIcons.person,
              iconSelected: LitIcons.person_solid),
          screen:
              ProfileScreen(toggleHideNavigationBar: toggleHideNavigationBar),
        ),
      ],
    );
  }
}
