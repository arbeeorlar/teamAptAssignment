import 'package:decorapp/modules/dashboard/screen/DashboardScreen.dart';
import 'package:decorapp/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double radiusCurve = width * 0.75;

    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF4EBAF),
            body: Column(
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Neo",
                            style: TextStyle(
                              color: PoColors.blackText,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            )),
                        TextSpan(
                            text: "Decor",
                            style: TextStyle(
                              color: PoColors.formError.withOpacity(0.40),
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.66,
                            height: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                                color: PoColors.formError.withOpacity(0.40),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width),
                                  bottomRight: Radius.circular(width),
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text("Let's",
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  const Text("decor",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic)),
                                  const Text("your home",
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: const Text(
                                        "Be faithful to your own taste,becuase nothing you really like is ever out of style.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  InkWell(
                                    onTap: moveToTheNextScreen,
                                    child: Container(
                                      height: 58,
                                      width: 58,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0))),
                                      child: SizedBox(
                                          height: 15,
                                          width: 20,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.black,
                                            ),
                                            // color: Colors.white,
                                            onPressed: moveToTheNextScreen,
                                          )),
                                    ),
                                  ),
                                ]),
                          )
                        ])
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  moveToTheNextScreen() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const DashbaordScreen()));
  }
}
