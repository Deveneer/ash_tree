import 'package:ash_tree/app/models/labs_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabCardItem extends StatelessWidget {
  final Data data;
  const LabCardItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _image(data.labDetails!.img!),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.labDetails!.name!,
                      style: Get.textTheme.headline6!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(data.labDetails!.labAddress!),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _image(String? img) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          img!,
          height: 100,
          fit: BoxFit.cover,
          width: 120,
          errorBuilder: (_, __, ___) => Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
            child: Icon(Icons.error),
          ),
        ),
      );
}
