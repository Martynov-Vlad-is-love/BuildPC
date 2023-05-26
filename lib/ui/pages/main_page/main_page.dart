import 'package:buildpc/constant.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/top_navigation_bar.dart';
import 'package:buildpc/ui/widgets/top_navigation_bar/top_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 80),
        child: const _NavigationBar(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                    flex: 2,
                    child: _Border(),
                  ),
                  Expanded(flex: 6, child: _MainView()),
                  Expanded(
                    flex: 2,
                    child: _Border(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
    );
  }
}

class _Border extends StatelessWidget {
  const _Border({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const isLog = false;
    String profileLabel = 'Sign in/Sign up';
    Icon profileWidget = const Icon(Icons.door_front_door_outlined);
    String destination = '/login';
    if (isLog == true) {
      profileLabel = 'My profile';
      profileWidget = const Icon(Icons.person);
      destination = '/profile';
    }

    return SafeArea(
      child: TopNavigationBar(
        label: 'BuildPC',
        height: kTopNavigationBarHeight,
        color: Colors.green[600],
        borderRadius: kTopNavigationBarBorderRadius,
        children: [
          const TopNavigationBarItem(
            icon: Icon(Icons.place),
            label: Text('Home'),
            destination: '/main',
          ),
          const TopNavigationBarItem(
            icon: Icon(Icons.computer),
            label: Text('My PC'),
            destination: '/main',
          ),
          TopNavigationBarItem(
            icon: profileWidget,
            label: Text(profileLabel),
            destination: destination,
          ),
        ],
      ),
    );
  }
}
