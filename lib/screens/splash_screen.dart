


import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';


var time = 0;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(
      Duration(seconds: 3),
          (timer) {
        setState(() {
          if (mounted) {
            setState(() {
              time = timer.tick;
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
            });
          }
        });
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            SizedBox(height: 60,),
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/images-removebg-preview.png'),
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
