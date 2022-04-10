import 'package:carousel_slider/carousel_slider.dart';
import 'package:decorapp/theme/app_colors.dart';
import 'package:decorapp/utils/SliderItem.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class DetailScreen extends StatefulWidget {
  SliderModel items;

  DetailScreen({required this.items, Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late List<bool> _likes;
  int _selectedIndex = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late List<SliderModel> sliderModel; // = List.filled(3, SliderModel());
  int counter = 1;
  int _ColorNobIndex = 0;

  bool showMinus = false;
  bool showPlus = true;
  bool showFavourite = false;

  Colors? overlayColor;

  @override
  void initState() {
    sliderModel = List.filled(3, widget.items!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFFECE0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xFFF4EBAF).withOpacity(0.40),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0))),
              child: const Icon(Icons.chevron_left, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CarouselSlider.builder(
              itemCount: sliderModel.length,
              carouselController: _controller,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      builderRow(context, itemIndex, sliderModel[itemIndex]),
              options: CarouselOptions(
                  height: 250,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: sliderModel.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key
                          ? PoColors.formError.withOpacity(0.40)
                          : PoColors.white),
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 20,
                      ),
                      child: Text(widget.items.title! ?? "",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Text(widget.items.description!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text("${widget.items.amount}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      )),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 20, top: 5),
            child: const Text(
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur "
                "voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    colorNob(index: 1, color: Colors.teal),
                    colorNob(index: 2, color: Colors.grey),
                    colorNob(index: 3, color: PoColors.formError),
                  ],
                ),
                Container(
                  width: 80,
                  height: 30,
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.20),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showMinus = true;
                          showPlus = false;
                          if (counter == 1) {
                            return;
                          }
                          if (counter >= 1) {
                            setState(() {
                              --counter;
                            });
                          } else {
                            setState(() {
                              counter = 1;
                            });
                          }
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: showMinus
                                    ? Colors.black
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0))),
                            child: const Icon(Icons.remove,
                                size: 20, color: Colors.white)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "$counter",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.40)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showMinus = false;
                          showPlus = true;
                          if (counter >= 1) {
                            setState(() {
                              ++counter;
                            });
                          } else {
                            setState(() {
                              counter = 1;
                            });
                          }
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: showPlus
                                    ? Colors.black
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(30.0))),
                            child: const Icon(Icons.add,
                                size: 20, color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: SizedBox(
                      height: 15,
                      width: 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: showFavourite ? Colors.red : Colors.black,
                        ),
                        // color: Colors.white,
                        onPressed: () {
                          setState(() {
                            showFavourite = !showFavourite;
                          });
                        },
                      )),
                ),
                InkWell(
                  onTap: () {
                    _displaySuccessMotionToast();
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    decoration: const BoxDecoration(
                        color: Color(0xFF0e333d),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                              color: Colors.white38.withOpacity(0.15),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(30.0))),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            // color: Colors.white,
                            onPressed: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget builderRow(BuildContext context, int index, SliderModel model) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter:
              const ColorFilter.mode(Colors.black, BlendMode.saturation),
          image: AssetImage(model.icon.toString()),
        ),
        // image:Image.asset('assets/images/lake.jpg'),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: Colors.transparent,
      ),
//          child: DecorationImage(image: ),
    );
  }

  Widget colorNob({int? index, Color? color, VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed ??
          () {
            setState(() {
              _ColorNobIndex = index!;
            });
          },
      child: Container(
        height: 38,
        width: 38,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: _ColorNobIndex == index
                ? color!.withOpacity(0.40)
                : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(30.0))),
        child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(30.0)))),
      ),
    );
  }

  void _displaySuccessMotionToast() {
    MotionToast.success(
      title: "Shopping Cart",
      description: "${widget.items.title} added to cart.",
      layoutOrientation: ORIENTATION.RTL,
      animationType: ANIMATION.FROM_BOTTOM,
      width: 300,
    ).show(context);
  }
}
