import 'package:ash_tree/app/models/banner_response.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBanner extends StatelessWidget {
  final String? url;
  final List<Data> data;

  const CustomBanner(this.data, {Key? key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: data.length,
      itemBuilder: (_, i, k) => InkWell(
        onTap: () {
          Get.toNamed(
            Routes.TEST_INFO,
            arguments: data[i].packageId,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              data[i].bannersImage!,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Icon(
                Icons.error,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 2 / 1,
        viewportFraction: .99,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
