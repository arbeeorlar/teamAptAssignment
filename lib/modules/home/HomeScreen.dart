import 'package:decorapp/modules/home/ChaiirsScreen.dart';
import 'package:decorapp/modules/home/DecorsScreen.dart';
import 'package:decorapp/modules/home/TrendingScreen.dart';
import 'package:decorapp/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Trending'),
    const Tab(text: 'Decors'),
    const Tab(text: 'Chairs'),
  ];

  final List<Widget> _tabChildrenWidget = [
    const TrendingScreen(),
    const DecorsScreen(),
    const ChairsScreen(),
  ];

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFECE0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20),
            child: const Text("Discover",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20),
            child: const Text("New items",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 0, right: 20),
            child: Row(
              children: [
                Expanded(child: searchBox()),
                Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      height: 43,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFF0e333d),
                          border: Border.all(
                              color: Colors.white60.withOpacity(0.10),
                              width: 1.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: SvgPicture.asset(
                        "images/funnel.svg",
                        color: Colors.white,
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 45,
            child: TabBar(
              isScrollable: true,
              controller: tabController,
              labelColor: PoColors.formError.withOpacity(0.40),
              unselectedLabelColor: const Color(0xFF0e333d),
              indicatorColor: PoColors.formError.withOpacity(0.40),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: myTabs,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: _tabChildrenWidget,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.only(
        left: 24,
        right: 10,
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: []),
      child: TextFormField(
        onChanged: (value) {},
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: PoColors.formError),
          ),
          prefixIcon: Icon(Icons.search, color: PoColors.blackText),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Search",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
