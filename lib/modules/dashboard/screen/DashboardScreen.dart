import 'package:decorapp/modules/home/HomeScreen.dart';
import 'package:decorapp/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DashbaordScreen extends StatefulWidget {
  const DashbaordScreen({Key? key}) : super(key: key);

  @override
  _DashbaordScreenState createState() => _DashbaordScreenState();
}

class _DashbaordScreenState extends State<DashbaordScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey key = GlobalKey();
  int _currentIndex = 0;
  final int _selectedIndex = 0;

  // Bottom Nav Tap Click
  onTapClickEvent(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children2 = [const HomeScreen()];
  var icon = [
    Icons.home_outlined,
    Icons.favorite_border_outlined,
    Icons.add_shopping_cart_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          top: false,
          bottom: false,
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: const Color(0xFFFAEFEF),
              body: Stack(
                children: [
                  IndexedStack(
                    index: _currentIndex,
                    children: _children2,
                  ),
                  const SizedBox(height: 20),
                  getFloatingBottomBar(_currentIndex)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getFloatingBottomBar(int index) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: const Color(0xFF0e333d)),
            child: bottomNavigationBar(index)));
  }

  Widget bottomNavigationBar(int index) {
    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      curve: Curves.fastOutSlowIn,
      key: UniqueKey(),
      child: Container(
        margin: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF0e333d),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTapClickEvent,
            selectedIconTheme: IconThemeData(
              color: PoColors.primary,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Container(
                    height: 15,
                    width: 20,
                    child: IconButton(
                      icon: Icon(
                        icon[0],
                        color: index == 0 ? PoColors.formError : Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(bottom: 7),
                    child: Container(
                        height: 15,
                        width: 20,
                        child: IconButton(
                          icon: Icon(
                            icon[1],
                            color:
                                index == 1 ? PoColors.formError : Colors.white,
                          ),
                          // color: Colors.white,
                          onPressed: () {},
                        )),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Container(
                    height: 15,
                    width: 20,
                    child: IconButton(
                      icon: Icon(
                        icon[2],
                        color: index == 2 ? PoColors.formError : Colors.white,
                      ),
                      // color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
