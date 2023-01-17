import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottom_bars.dart';
import 'package:online/constant.dart';
import 'home_page.dart';
import 'package:show_up_animation/show_up_animation.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ShowUpAnimation(
                delayStart: Duration(microseconds: 500),
                animationDuration: Duration(milliseconds: 500),
                curve: Curves.bounceIn,
                direction: Direction.horizontal,
                offset: 0.5,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Login By Your',
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.w400),
                        ),
                        children: const [
                          TextSpan(
                              text: '\nFinger Print',
                              style: TextStyle(
                                  color: printColor, letterSpacing: -0.5))
                        ]),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/car.gif',
              ),
              ShowUpAnimation(
                delayStart: Duration(microseconds: 1000),
                animationDuration: Duration(milliseconds: 1000),
                curve: Curves.bounceIn,
                direction: Direction.vertical,
                offset: 0.5,
                child: Text(
                  'Model S',
                  style: GoogleFonts.ibmPlexMono(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const Spacer(),
              Stack(
                children: [
                  Positioned(
                    top: 12.5,
                    left: 12.5,
                    child: Image.asset(
                      'assets/images/fingerprint.png',
                      height: 75,
                      color: printColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BottomBars()));
                    },
                    child: Image.asset(
                      'assets/images/circle.gif',
                      height: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
