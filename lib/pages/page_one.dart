import 'package:ahanna/constants.dart';
import 'package:ahanna/pages/page_two.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = double.infinity;
    return Scaffold(
      backgroundColor: backgroundColor.withValues(alpha: .3),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            gotToSecondPage(context);
          }
        },
        child: Container(
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage(backgroundImage),
              fit: MediaQuery.of(context).size.width > 700
                  ? BoxFit.cover
                  : null,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 400.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "بِسْمِ ٱللّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                      style: bismillahTextStyle,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "With the blessings of Almighty Allah,",
                      style: topSubtitleTextStyle,
                    ),
                    Text(
                      "we are delighted to invite you to join us for the",
                      style: topSubtitleTextStyle,
                    ),
                    Text(
                      "Nikah (Aqd) Ceremony of",
                      style: topSubtitleTextStyle,
                    ),
                    SizedBox(height: 32),
                    Text("MD. SHIBLEE NOMAN", style: fullNameTextStyle),
                    SizedBox(height: 8),
                    Text("AHAD &", style: titleTextStyle),
                    Text("TIANNA", style: titleTextStyle),
                    SizedBox(height: 8),
                    Text("ASHIK PRAPTI", style: fullNameTextStyle),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 16),
                      child: Text(
                        "as they begin their journey of togetherness.",
                        style: bottomTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Image.asset(scrollImage, scale: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> gotToSecondPage(BuildContext context) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return PageTwo();
        },
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0); // Start from the bottom
          const end = Offset.zero; // End at the top
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
