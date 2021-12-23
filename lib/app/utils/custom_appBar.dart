import 'package:ash_tree/app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
AppBar AppBarWithAction(
        {required String title,
        required String subTitle,
        required Function onActionPress,
        required IconData icon}) =>
    AppBar(
      title: Text(
        title,
        style: Get.textTheme.headline6!
            .copyWith(color: kPrimaryColor, fontWeight: FontWeight.w700),
      ),
      elevation: 0.0,
      centerTitle: true,
    );
// ignore: non_constant_identifier_names
AppBar CustomAppBar({required String title, required String subTitle}) =>
    AppBar(
      title: Text(
        title,
        style: Get.textTheme.headline6!
            .copyWith(color: kPrimaryColor, fontWeight: FontWeight.w700),
      ),
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: kPrimaryColor,
        ),
        onPressed: () => Get.back(),
      ),
      centerTitle: true,
    );
// ignore: non_constant_identifier_names
AppBar CustomAppBarNoBack({required String title, required String subTitle}) =>
    AppBar(
      title: Text(
        title,
        style: Get.textTheme.headline6!
            .copyWith(color: kPrimaryColor, fontWeight: FontWeight.w700),
      ),
      elevation: 0.0,
      centerTitle: true,
    );
