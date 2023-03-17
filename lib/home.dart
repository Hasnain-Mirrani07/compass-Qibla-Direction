import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? heading = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Qibla Direction",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "${heading!.ceil()}",
              style: const TextStyle(color: Colors.white, fontSize: 50),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/cadrant.png"),
                    fit: BoxFit.cover,
                    height: 300,
                    width: 300,
                  ),
                  Transform.rotate(
                    angle: ((heading ?? 0) * (pi / 180) * -1),
                    child: Image.asset(
                      "assets/compass.png",
                      scale: 1.1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
