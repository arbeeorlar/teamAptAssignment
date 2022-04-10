import 'package:carousel_slider/carousel_slider.dart';
import 'package:decorapp/modules/detail/DetailScreen.dart';
import 'package:decorapp/utils/SliderItem.dart';
import 'package:flutter/material.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  SliderContent slider = SliderContent();
  late List<bool> _likes;
  int _selectedIndex = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    // TODO: implement initState
    _likes = List.filled(slider.getSliderItem().length, true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: slider.getSliderItem().length,
        carouselController: _controller,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            builderRow12(context, itemIndex, slider.getSliderItem()[itemIndex]),
        options: CarouselOptions(
            height: double.infinity,
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
            }));
  }

//   Widget builderRow(BuildContext context, int index, SliderModel model) {
//     return Container(
//       margin: const EdgeInsets.only(right: 20),
//       child: Stack(
//         children: <Widget>[
//           InkWell(
//             onTap: () => moveToTheNextScreen(model),
//             child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.fill,
//                   colorFilter:
//                       const ColorFilter.mode(Colors.black, BlendMode.dstATop),
//                   image: AssetImage(model.icon.toString()),
//                 ),
//                 // image:Image.asset('assets/images/lake.jpg'),
//                 borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//                 color: Colors.transparent,
//               ),
// //          child: DecorationImage(image: ),
//             ),
//           ),
//           Container(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(
//                         left: 10,
//                         right: 20,
//                       ),
//                       child: Text(model.title!,
//                           textAlign: TextAlign.left,
//                           style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(
//                           left: 10, right: 10, bottom: 10),
//                       child: Text(model.description!,
//                           textAlign: TextAlign.left,
//                           style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.white,
//                           )),
//                     ),
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       print("::::::::::::::::::::::::::");
//                       model.isLike = !model.isLike!;
//                     });
//                   },
//                   child: Container(
//                     height: 48,
//                     width: 48,
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30.0))),
//                     child: SizedBox(
//                         height: 15,
//                         width: 20,
//                         child: IconButton(
//                           icon: model.isLike!
//                               ? const Icon(
//                                   Icons.favorite_border,
//                                   color: Colors.red,
//                                 )
//                               : const Icon(
//                                   Icons.favorite_border_outlined,
//                                   color: Colors.white,
//                                 ),
//                           // color: Colors.white,
//                           onPressed: () {
//                             setState(() {
//                               model.isLike = !model.isLike!;
//                             });
//                           },
//                         )),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

  Widget builderRow12(BuildContext context, int index, SliderModel model) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () => moveToTheNextScreen(model),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.dstATop),
              image: AssetImage(model.icon.toString()),
            ),
            // image:Image.asset('assets/images/lake.jpg'),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Colors.transparent,
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      child: Text(model.title!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Text(model.description!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      model.isLike = !model.isLike!;
                    });
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: SizedBox(
                      height: 15,
                      width: 20,
                      child: FloatingActionButton(
                        heroTag: "btn$index",
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: _likes[index] ? Colors.white : Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            _likes[index] = !_likes[index];
                          });
                        },
                      ),
                      // IconButton(
                      //   icon: model.isLike!
                      //       ? const Icon(
                      //           Icons.favorite_border,
                      //           color: Colors.red,
                      //         )
                      //       : const Icon(
                      //           Icons.favorite_border_outlined,
                      //           color: Colors.white,
                      //         ),
                      //   // color: Colors.white,
                      //   onPressed: () {
                      //     setState(() {
                      //       model.isLike = !model.isLike!;
                      //     });
                      //   },
                      // )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  moveToTheNextScreen(SliderModel model) async {
    await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailScreen(items: model)));
  }
}
