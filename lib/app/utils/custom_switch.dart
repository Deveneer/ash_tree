import 'package:ash_tree/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSwitch extends StatelessWidget {
  final Function onAPressed;
  final Function onBPressed;
  final bool switchAValue;
  final bool switchBValue;

  const CustomSwitch(
      {Key? key,
      required this.onAPressed,
      required this.onBPressed,
      required this.switchAValue,
      required this.switchBValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          minWidth: Get.width,
          padding: EdgeInsets.symmetric(vertical: 12),
          onPressed: onAPressed(),
          child: Text(
            'Emirates ID',
            style: Get.textTheme.headline5!.copyWith(
                color: switchAValue ? kTextFieldBorderColor : Colors.grey),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                  color: switchAValue ? kTextFieldBorderColor : Colors.grey)),
        ),
        SizedBox(
          height: 16,
        ),
        MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 12),
          minWidth: Get.width,
          onPressed: onBPressed(),
          child: Text('Passport - Number',
              style: Get.textTheme.headline5!.copyWith(
                  color: switchBValue ? kTextFieldBorderColor : Colors.grey)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                  color: switchBValue ? kTextFieldBorderColor : Colors.grey)),
        ),
      ],
    );
  }
}

class CustomForGenderSwitch extends StatelessWidget {
  final Function onAPressed;
  final Function onBPressed;
  final bool switchAValue;
  final bool switchBValue;

  const CustomForGenderSwitch(
      {Key? key,
      required this.onAPressed,
      required this.onBPressed,
      required this.switchAValue,
      required this.switchBValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            // minWidth: Get.width,
            padding: EdgeInsets.symmetric(vertical: 10),
            onPressed: onAPressed(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Male',
                  style: Get.textTheme.headline5!.copyWith(
                      color:
                          switchAValue ? kTextFieldBorderColor : Colors.grey),
                ),
                SizedBox(
                  width: 4,
                ),
                switchAValue
                    ? Icon(
                        Icons.check,
                        color: kTextFieldBorderColor,
                      )
                    : Container()
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(
                    color: switchAValue ? kTextFieldBorderColor : Colors.grey)),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 10),
            minWidth: Get.width,
            onPressed: onBPressed(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Female',
                  style: Get.textTheme.headline5!.copyWith(
                      color:
                          switchBValue ? kTextFieldBorderColor : Colors.grey),
                ),
                SizedBox(
                  width: 4,
                ),
                switchBValue
                    ? Icon(
                        Icons.check,
                        color: kTextFieldBorderColor,
                      )
                    : Container()
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                  color: switchBValue ? kTextFieldBorderColor : Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
