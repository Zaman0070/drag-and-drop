import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online/constant.dart';
import 'package:show_up_animation/show_up_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchButton = false;
  bool charging = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: charging ? backgroundColor : Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: charging ? backgroundColor : Colors.black,
        leading: ShowUpAnimation(
          delayStart: Duration(microseconds: 200),
          animationDuration: Duration(milliseconds: 200),
          curve: Curves.bounceIn,
          direction: Direction.horizontal,
          offset: 0.5,
          child: const Icon(
            Icons.settings_outlined,
            color: Colors.grey,
            size: 28,
          ),
        ),
        actions: [
          ShowUpAnimation(
              delayStart: Duration(microseconds: 400),
              animationDuration: Duration(milliseconds: 400),
              curve: Curves.bounceIn,
              direction: Direction.horizontal,
              offset: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/notification.png',
                  color: Colors.grey,
                ),
              )),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShowUpAnimation(
                  delayStart: Duration(microseconds: 600),
                  animationDuration: Duration(milliseconds: 600),
                  curve: Curves.bounceIn,
                  direction: Direction.horizontal,
                  offset: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '98.7%',
                          style: GoogleFonts.ibmPlexMono(
                            textStyle: TextStyle(
                                color:
                                    charging ? Colors.black : backgroundColor,
                                fontSize: 30,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          'Charge',
                          style: GoogleFonts.ibmPlexMono(
                            textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )),
              ShowUpAnimation(
                  delayStart: Duration(microseconds: 800),
                  animationDuration: Duration(milliseconds: 800),
                  curve: Curves.bounceIn,
                  direction: Direction.horizontal,
                  offset: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '18C',
                          style: GoogleFonts.ibmPlexMono(
                            textStyle: TextStyle(
                                color:
                                    charging ? Colors.black : backgroundColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          'Temp',
                          style: GoogleFonts.ibmPlexMono(
                            textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )),
              ShowUpAnimation(
                  delayStart: Duration(microseconds: 1000),
                  animationDuration: Duration(milliseconds: 1000),
                  curve: Curves.bounceIn,
                  direction: Direction.horizontal,
                  offset: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '45%',
                          style: GoogleFonts.ibmPlexMono(
                            textStyle: TextStyle(
                                color:
                                    charging ? Colors.black : backgroundColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          'Fuel',
                          style: GoogleFonts.ibmPlexMono(
                            textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        charging
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: Row(
                  children: [
                    ShowUpAnimation(
                        delayStart: Duration(microseconds: 1200),
                        animationDuration: Duration(milliseconds: 1200),
                        curve: Curves.bounceIn,
                        direction: Direction.horizontal,
                        offset: 0.5,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/locked.png',
                            ),
                          ),
                        )),
                    ShowUpAnimation(
                        delayStart: Duration(microseconds: 1400),
                        animationDuration: Duration(milliseconds: 1400),
                        curve: Curves.bounceIn,
                        direction: Direction.vertical,
                        offset: 0.5,
                        child: Image.asset(
                          switchButton
                              ? 'assets/images/light.gif'
                              : 'assets/images/wlight.gif',
                          height: 200,
                        )),
                    ShowUpAnimation(
                        delayStart: Duration(microseconds: 1600),
                        animationDuration: Duration(milliseconds: 1600),
                        curve: Curves.bounceIn,
                        direction: Direction.horizontal,
                        offset: 0.5,
                        child: switchButton
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    switchButton = false;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: printColor,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/lamp.png',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    switchButton = true;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      'assets/images/lamp.png',
                                    ),
                                  ),
                                ),
                              )),
                  ],
                ),
              )
            : Image.asset('assets/images/charging.gif'),
        Spacer(),
        charging
            ? InkWell(
                onTap: () {
                  setState(() {
                    charging = false;
                  });
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey.shade300,
                            blurRadius: 10)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/images/power-off.png',
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  setState(() {
                    charging = true;
                  });
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(color: Colors.grey.shade200, width: 2),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey.shade300,
                            blurRadius: 10)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/images/power-off.png',
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
        const SizedBox(
          height: 20,
        ),

        // Image.asset('assets/images/withoutlight.gif')
      ]),
    );
  }
}
