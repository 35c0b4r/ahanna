import 'dart:math' as math;

import 'package:ahanna/constants.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          children: [
            Transform.rotate(
              angle: -math.pi / 12,
              child: Column(
                children: [
                  Text(
                    "Save the",
                    style: saveTheDateStyle.copyWith(color: secondaryTextColor),
                  ),
                  Text("Date", style: saveTheDateStyle),
                ],
              ),
            ),
            Text("SEPTEMBER"),
          ],
        ),
      ),
    );
  }
}
