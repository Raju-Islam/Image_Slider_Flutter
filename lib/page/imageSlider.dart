// ignore_for_file: file_names, unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_slider/config/appColor.dart';
import 'package:image_slider/config/size.dart';
import 'package:image_slider/widget/buildImage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderPage extends StatefulWidget {
  const ImageSliderPage({Key? key}) : super(key: key);

  @override
  _ImageSliderPageState createState() => _ImageSliderPageState();
}

class _ImageSliderPageState extends State<ImageSliderPage> {
  final controller = CarouselController();
  int activeIndex = 0;
  final locationImages = [
    'asset/Barisal Division.jpg',
    'asset/Chittagong Division.jpg',
    'asset/Dhaka Division.jpg',
    'asset/Khulna Division.jpg',
    'asset/Mymensingh Division.jpg',
    'asset/Rangpur Division.jpg',
    'asset/Sylhet Division1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    // ignore: unused_element
    double fontSize(double size) {
      return size * width / 414;
    }

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Image Slider "),
        ),
        // ignore: sized_box_for_whitespace
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                  itemCount: locationImages.length,
                  itemBuilder: (context, index, realindex) {
                    final locationImage = locationImages[index];
                    return buildImages(locationImage, index);
                  },
                  carouselController: controller,
                  options: CarouselOptions(
                    height: height / 3,
                    initialPage: 0,
                    //autoPlay: true,
                    enableInfiniteScroll: false,
                    autoPlayInterval: const Duration(seconds: 2),
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              buildIndicator(),
              const SizedBox(height: 30),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 70, left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          splashColor: Colors.transparent,
                          splashRadius: 3.0,
                          onPressed: () {
                            controller.previousPage(
                                duration: const Duration(milliseconds: 500));
                          },
                          icon: const Icon(
                            Icons.navigate_before,
                            size: 50,
                          )),
                      IconButton(
                          splashColor: Colors.transparent,
                          splashRadius: 3.0,
                          onPressed: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 500));
                          },
                          icon: const Icon(
                            Icons.navigate_next,
                            size: 50,
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: (index) {
          controller.animateToPage(index);
        },
        activeIndex: activeIndex,
        count: locationImages.length,
        effect: WormEffect(
            activeDotColor: Colors.blue.shade400,
            dotColor: Colors.blue.shade100),
      );
}
