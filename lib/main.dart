import 'package:ahanna/pages/page_one.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '#ahanna',
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color(0xFF000000),
        ),
      ),
      home: const MyHomePage(title: '#ahanna'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          PageOne(),
          Container(
            color: Colors.green,
            child: const Center(child: Text('Page 2')),
          ),
          Container(
            color: Colors.blue,
            child: const Center(child: Text('Page 3')),
          ),
        ],
      ),
    );
  }
}
