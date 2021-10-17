
// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
class buildImages extends StatelessWidget {
  const buildImages(this.locationImage, int index, { Key? key }) : super(key: key);
final String? locationImage;
  @override
  Widget build(BuildContext context) {
    // String locationImage;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.asset(locationImage!,
      fit:BoxFit.fill
      ),
    );
  }
}