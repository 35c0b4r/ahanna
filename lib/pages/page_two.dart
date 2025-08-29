import 'dart:math' as math;
import 'package:ahanna/constants.dart';
import 'package:ahanna/pages/page_one.dart';
import 'package:ahanna/pages/page_three.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.pop(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 3),
                reverseTransitionDuration: Duration(
                  seconds: 1,
                ), // Customize the pop duration here
                pageBuilder: (context, animation, secondaryAnimation) {
                  return PageOne();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      const begin = Offset(
                        0.0,
                        0.0,
                      ); // Start from the current position
                      const end = Offset(
                        0.0,
                        1.0,
                      ); // Move downwards (pop transition)
                      const curve = Curves.easeInOut;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
              ),
            );
          } else if (details.primaryVelocity! < 0) {
            customGreetingsDialog(context);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(patternBackgroundImage),
              opacity: .3,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.rotate(
                  angle: -math.pi / 12,
                  child: Column(
                    children: [
                      Text(
                        "Save the",
                        style: saveTheDateStyle.copyWith(
                          color: secondaryTextColor,
                        ),
                      ),
                      Text("Date", style: saveTheDateStyle),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                DateAndTime(),
                SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse("https://maps.app.goo.gl/2AbAaTAxgQotFXsy6"),
                      mode: LaunchMode.externalApplication,
                    )) {
                      throw Exception('Could not launch url');
                    }
                  },
                  child: LocationWidget(),
                ),
                SizedBox(height: 16),
                EventScheduleImage(),
                SizedBox(height: 16),
                DressCode(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(scrollImage, scale: 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventScheduleImage extends StatelessWidget {
  const EventScheduleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 450),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: .3)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Image.asset(eventScheduleImage),
      ),
    );
  }
}

class DressCode extends StatelessWidget {
  const DressCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Dress Code", style: dressCodeSubTitleTextStyle),
        Text("Elegant & Modest", style: dressCodeTitleTextStyle),
        SizedBox(height: 12),
        Text("Color Palette", style: dressCodeSubTitleTextStyle),
        Text("Bright Pastels & Neutrals", style: dressCodeTitleTextStyle),
      ],
    );
  }
}

class EventSchedule extends StatelessWidget {
  const EventSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Event Schedule", style: eventTitleStyle),
        SizedBox(height: 12),
        Container(
          // height: 200,
          // width: 500,
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: .3)),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("12:00 PM - 01:30 PM", style: eventSubTitleStyle),
                    Text("Outdoor Photoshoot", style: eventSubTitleStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("01:30 PM - 02:00 PM", style: eventSubTitleStyle),
                    Text(
                      "Guest Arrival & Gathering",
                      style: eventSubTitleStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("02:00 PM - 02:30 PM", style: eventSubTitleStyle),
                    Text("Aqd (Nikah Ceremony)", style: eventSubTitleStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("02:30 PM - 04:00 PM", style: eventSubTitleStyle),
                    Text("Lunch / Food Serving", style: eventSubTitleStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("04:00 PM - 05:00 PM", style: eventSubTitleStyle),
                    Text(
                      "Indoor Photoshoot & Greetings",
                      style: eventSubTitleStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [secondaryTextColor, primaryTextColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          child: Icon(Icons.location_on, size: 32, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text("Impetus Lounge", style: locationTitleStyle),
        Text(
          "Impetus Center (Rooftop), \n242/B Bir Uttam Mir Shawkat Sarak, Dhaka 1208",
          textAlign: TextAlign.center,
          style: locationSubTitleStyle,
        ),
      ],
    );
  }
}

class DateAndTime extends StatelessWidget {
  const DateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SizedBox(
            width: screenWidth / 4,
            child: Column(
              children: [
                Divider(thickness: 1, color: secondaryTextColor),
                Text("FRIDAY", style: dateStyle),
                Divider(thickness: 1, color: secondaryTextColor),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SEPTEMBER", style: dateStyle),
            Text("05", style: onlyDateStyle),
            Text("2025", style: dateStyle.copyWith(letterSpacing: 12)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            width: screenWidth / 4.5,
            child: Column(
              children: [
                Divider(thickness: 1, color: secondaryTextColor),
                Text("12:00 PM", style: dateStyle),
                Divider(thickness: 1, color: secondaryTextColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
