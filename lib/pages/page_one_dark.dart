import 'dart:math' as math;

import 'package:flutter/material.dart';

class PageOneDark extends StatefulWidget {
  const PageOneDark({super.key});

  @override
  State<PageOneDark> createState() => _PageOneDarkState();
}

class _PageOneDarkState extends State<PageOneDark> {
  double _opacity = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height / 2;
    final double width = double.infinity;
    final TextStyle titleTextStyle = TextStyle(
      color: Color(0xFFECECEC),
      fontSize: 48,
      fontFamily: "Julius Sans One",
      height: 1.0,
    );
    final TextStyle subTitleTextStyle = TextStyle(
      color: Color(0xFFB0B0B0),
      fontSize: 12,
      fontFamily: "Julius Sans One",
      height: 1.0,
    );
    final saveTheDateStyle = TextStyle(
      color: Color(0xFFDCB58A),
      fontSize: 48,
      fontFamily: "Krishti",
      height: 1.0,
    );
    final dateStyle = TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 34,
      fontFamily: "Julius Sans One",
      height: 1.0,
    );
    List<double> bwMatrix = [
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix(bwMatrix),
                  child: Image.asset(
                    "assets/images/top_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF161616),
                      Color(0xFF161616).withValues(alpha: 0.7),
                      Color(0xFF161616),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SelectableText(
                    "بِسْمِ ٱللّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 12,
                      fontFamily: "IoanOldSt BT",
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SelectionArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "With the blessings of Almighty Allah,",
                        style: subTitleTextStyle,
                      ),
                      Text(
                        "we are delighted to invite you to join us for the",
                        style: subTitleTextStyle,
                      ),
                      Text(
                        "Nikah (Aqdh) Ceremony of",
                        style: subTitleTextStyle,
                      ),
                      SizedBox(height: 20),
                      Text("AHAD &", style: titleTextStyle),
                      Text("TIANNA", style: titleTextStyle),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Spacer(),
            Spacer(),
            Spacer(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 800),
                  child: SelectionArea(
                    child: Column(
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 12.0,
                          child: Column(
                            children: [
                              Text("Save the", style: saveTheDateStyle),
                              Text("Date", style: saveTheDateStyle),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("05 SEP,", style: dateStyle),
                        Text(
                          "2025",
                          style: dateStyle.copyWith(letterSpacing: 8),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
