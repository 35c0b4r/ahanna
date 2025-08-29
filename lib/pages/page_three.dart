import 'dart:math' as math;
import 'dart:ui';

import 'package:ahanna/constants.dart';
import 'package:flutter/material.dart';

Future<Object?> customGreetingsDialog(BuildContext context) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Greetings",
    context: context,
    transitionDuration: Duration(seconds: 1),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) {
      return GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.of(context).pop();
          }
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Center(
            child: Container(
              height: 320,
              margin: EdgeInsets.symmetric(horizontal: 16),
              constraints: BoxConstraints(maxWidth: 500),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        greetingsImage,
                        fit: BoxFit.cover,
                        height: 320,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: .5),
                            Colors.black54.withValues(alpha: .3),
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Your presence and heartfelt prayers will be",
                            style: greetingsSubTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "cherished as we mark this beautiful beginning.",
                            style: greetingsSubTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Together with their families,",
                            style: greetingsSubTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Tianna, daughter of",
                            style: greetingsSubTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Mr. P. A. Rasul Tuku \n& Mrs. Taskin Mohit",
                            style: greetingsTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Ahad, son of",
                            style: greetingsSubTitleTextStyle,
                          ),
                          Text(
                            "Mr. Harun Or Rashid \n& Mrs. Ayesha Akter",
                            style: greetingsTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "joyfully invite you to their Nikah ceremony.",
                            style: greetingsSubTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -16,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: backgroundColor,
                          child: Transform.rotate(
                            angle: math.pi,
                            child: Image.asset(scrollImage, scale: 3.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
