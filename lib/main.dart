import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_palyer/provider/youtube_provider.dart';
import 'package:video_palyer/screens/splash_screen.dart';


void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => YoutubeProvider(),builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ),);
  }
}
