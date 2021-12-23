import 'package:ash_tree/app/constants/assets.dart';
import 'package:ash_tree/app/models/all_address_response.dart';
import 'package:ash_tree/app/modules/address/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddressCard extends StatelessWidget {
  final Data data;
  AddressCard(this.data);
  final AddressController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              kOutlinedHomeSVG,
              width: 40,
              color: Colors.grey,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        data.name!,
                        style: Get.textTheme.headline6,
                      )),
                      IconButton(
                          onPressed: () =>
                              _controller.onDeletePressed(data.id!),
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () => _controller.onEditPressed(data),
                          icon: Icon(Icons.edit)),
                    ],
                  ),
                  Text(
                    data.address!,
                    style: Get.textTheme.bodyText2,
                  ),
                  Text(
                    '${data.city!}, ${data.state!}${data.pinCode! == "Not Available" ? '' : ','} ${data.pinCode! == "Not Available" ? '' : data.pinCode}',
                    style: Get.textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Mobile: ${data.mobileNumber!}',
                    style: Get.textTheme.bodyText2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
