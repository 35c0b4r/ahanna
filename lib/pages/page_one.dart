import 'package:ahanna/constants.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = double.infinity;
    return Stack(
      children: [
        SizedBox(
          width: width,
          child: Image.asset(backgroundImage, fit: BoxFit.cover),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SelectableText(
              "بِسْمِ ٱللّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
              style: bismillahTextStyle,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "With the blessings of Almighty Allah,",
                  style: topSubtitleTextStyle,
                ),
                Text(
                  "we are delighted to invite you to join us for the",
                  style: topSubtitleTextStyle,
                ),
                Text("Nikah (Aqdh) Ceremony of", style: topSubtitleTextStyle),
                SizedBox(height: 32),
                Text("MD. SHIBLEE NOMAN", style: fullNameTextStyle),
                SizedBox(height: 8),
                Text("AHAD &", style: titleTextStyle),
                Text("TIANNA", style: titleTextStyle),
                SizedBox(height: 8),
                Text("ASHIK PRAPTI", style: fullNameTextStyle),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    "as they begin their journey of togetherness.",
                    style: bottomTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Image.asset(swipeUpImage),
          ),
        ),
      ],
    );
  }
}
