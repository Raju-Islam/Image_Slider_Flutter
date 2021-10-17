import 'package:flutter/material.dart';
import 'package:image_slider/config/appColor.dart';
import 'package:image_slider/page/imageSlider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        
      ),
      // ignore: prefer_const_constructors
      home: ImageSliderPage(),
    );
  }
}