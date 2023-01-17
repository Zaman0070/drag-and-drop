import 'package:flutter/material.dart';
import 'package:online/constant.dart';
import 'home_page.dart';

class BottomBars extends StatefulWidget {
  const BottomBars({Key? key}) : super(key: key);

  @override
  State<BottomBars> createState() => _BottomBarsState();
}

class _BottomBarsState extends State<BottomBars> {
  int index = 0;
  final PageStorageBucket _bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Color(0xff675492),
            child: PageStorage(
              bucket: _bucket,
              child: currentScreen,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        // notchMargin: 8,
        child: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    index = 0;
                    currentScreen = const HomePage();
                  });
                },
                child: Image.asset(
                  'assets/images/house.png',
                  color: index == 0 ? printColor : Colors.grey,
                  height: 22,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 1;
                    currentScreen = const HomePage();
                  });
                },
                child: Image.asset(
                  'assets/images/connection.png',
                  color: index == 1 ? printColor : Colors.grey,
                  height: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 2;
                    currentScreen = const HomePage();
                  });
                },
                child: Image.asset(
                  'assets/images/electric.png',
                  color: index == 2 ? printColor : Colors.grey,
                  height: 26,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 3;
                    currentScreen = const HomePage();
                  });
                },
                child: Image.asset(
                  'assets/images/fan.png',
                  color: index == 3 ? printColor : Colors.grey,
                  height: 22,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 4;
                    currentScreen = const HomePage();
                  });
                },
                child: Image.asset(
                  'assets/images/location.png',
                  color: index == 4 ? printColor : Colors.grey,
                  height: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
