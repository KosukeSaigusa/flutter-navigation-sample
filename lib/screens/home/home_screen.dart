import 'package:flutter/material.dart';
import 'package:flutter_navigation_sample/screens/chat/chat_screen.dart';
import 'package:flutter_navigation_sample/screens/find_club/find_club_screen.dart';
import 'package:flutter_navigation_sample/screens/home/home_screen_model.dart';
import 'package:flutter_navigation_sample/screens/my_page/my_page_screen.dart';
import 'package:flutter_navigation_sample/screens/timeline/timeline_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();
  final int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenModel>(
      create: (_) => HomeScreenModel(),
      child: Consumer<HomeScreenModel>(
        builder: (context, homeScreenModel, child) {
          return Scaffold(
            body:
                // Center(
                //   child: Checkbox(
                //     value: homeScreenModel.isChecked,
                //     onChanged: (value) {
                //       print(value);
                //       homeScreenModel.onCheckBoxTap(value: value);
                //     },
                //   ),
                // ),
                homeScreenBody(context),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => FindClubScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              tooltip: 'Find',
              child: const Icon(Icons.search),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavBarItems,
              currentIndex: homeScreenModel.currentIndex,
              onTap: (currentIndex) {
                homeScreenModel.onTabTap(currentIndex);
              },
            ),
          );
        },
      ),
    );
  }

  final List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'マイページ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'チャット',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.timeline),
      label: 'タイムライン',
    ),
  ];

  Widget homeScreenBody(BuildContext context) {
    final homeScreenModel = Provider.of<HomeScreenModel>(context);
    final currentIndex = homeScreenModel.currentIndex;
    return Stack(
      children: <Widget>[
        bottomTabScreen(
            currentIndex: currentIndex, tabIndex: 0, screen: MyPageScreen()),
        bottomTabScreen(
            currentIndex: currentIndex, tabIndex: 1, screen: ChatScreen()),
        bottomTabScreen(
            currentIndex: currentIndex, tabIndex: 2, screen: TimelineScreen()),
      ],
    );
  }

  Widget bottomTabScreen(
      {@required int currentIndex,
      @required int tabIndex,
      @required StatelessWidget screen}) {
    return Visibility(
      visible: currentIndex == tabIndex,
      maintainState: true,
      child: screen,
    );
  }
}
