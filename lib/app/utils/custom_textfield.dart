import 'package:ash_tree/app/constants/colors.dart';
import 'package:ash_tree/app/constants/strings.dart';
import 'package:ash_tree/app/routes/app_pages.dart';
import 'package:ash_tree/app/utils/custom_formatter.dart';
import 'package:ash_tree/app/utils/custom_validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneTextField({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      cursorColor: kPrimaryColor,
      validator: (e) {
        // if (e!.length == 7 && GetUtils.isNumericOnly(e))
        if (GetUtils.isPhoneNumber(e!))
          return null;
        else
          return 'Please enter correct number!';
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 2),
              borderRadius: BorderRadius.circular(8)),
          prefix: Text('+971 '),
          labelStyle: Get.textTheme.headline6!.copyWith(
              color: kTextFieldBorderColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 2),
              borderRadius: BorderRadius.circular(8)),
          labelText: 'Phone Number',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 2),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}

class NameTextField extends StatelessWidget {
  final TextEditingController controller;

  const NameTextField({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      cursorColor: kPrimaryColor,
      validator: (e) {
        if (e!.length > 2)
          return null;
        else
          return 'Please enter correct name!';
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8)),
          labelStyle: Get.textTheme.headline6!.copyWith(
              color: kTextFieldBorderColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          hintText: 'Name',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8)),
          labelText: 'Name',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}

class UniversalTextField extends StatelessWidget {
  final TextEditingController controller;

  const UniversalTextField({Key? key, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        labelStyle: Get.textTheme.headline6!.copyWith(
            color: kTextFieldBorderColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: kPrimaryColor,
      validator: (e) {
        if (GetUtils.isEmail(e!))
          return null;
        else
          return 'Please enter correct email!';
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5)),
          labelStyle: Get.textTheme.headline6!.copyWith(
              color: kTextFieldBorderColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5)),
          labelText: 'Email',
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: kTextFieldBorderColor, width: 1.5))),
    );
  }
}

class DobTextField extends StatelessWidget {
  final TextEditingController controller;

  const DobTextField({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextInputFormatter formatDOB =
        CustomFormatter(mask: '##/##/####', separator: '/');

    return TextFormField(
      inputFormatters: [formatDOB],
      controller: controller,
      keyboardType: TextInputType.phone,
      cursorColor: kPrimaryColor,
      validator: (dateOfBirth) {
        return CustomValidators.isValidDateOfBirth(dateOfBirth)
            ? null
            : 'Please enter a valid DOB.';
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8)),
          labelStyle: Get.textTheme.headline6!.copyWith(
              color: kTextFieldBorderColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          hintText: 'DD/MM/YYYY',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8)),
          labelText: 'DOB',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}

class RelationshipTextField extends StatelessWidget {
  final TextEditingController controller;

  const RelationshipTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      cursorColor: kPrimaryColor,
      validator: (e) {
        if (e!.length > 1)
          return null;
        else
          return 'Please enter correct relation!';
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8)),
          labelStyle: Get.textTheme.headline6!.copyWith(
              color: kTextFieldBorderColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8)),
          labelText: 'Relationship',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}

class EmirateIDTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String labelText;
  final TextInputType keyboardType;
  final formatter;

  const EmirateIDTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.keyboardType,
    required this.formatter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [formatter],
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: kPrimaryColor,
      textCapitalization: TextCapitalization.words,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.4),
              borderRadius: BorderRadius.circular(8)),
          labelStyle: Get.textTheme.headline6!.copyWith(
              color: kTextFieldBorderColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.4),
              borderRadius: BorderRadius.circular(8)),
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.4),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}

class PassportNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String labelText;
  final TextInputType keyboardType;

  const PassportNumberTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.keyboardType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: kPrimaryColor,
      textCapitalization: TextCapitalization.words,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.4),
              borderRadius: BorderRadius.circular(8)),
          labelStyle: Get.textTheme.headline6!.copyWith(
              color: kTextFieldBorderColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.4),
              borderRadius: BorderRadius.circular(8)),
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.4),
              borderRadius: BorderRadius.circular(8))),
    );
  }
}

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  const SearchTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (searchQuery) {
        if (searchQuery != "") {
          Get.toNamed(Routes.SEARCH_RESULT, arguments: searchQuery);
        } else {
          Get.snackbar(
            "Search can't be empty.",
            'Please search a valid test package.',
          );
        }
      },
      keyboardType: TextInputType.text,
      cursorColor: kPrimaryColor,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              if (controller.text != "") {
                Get.toNamed(Routes.SEARCH_RESULT, arguments: controller.text);
              } else {
                Get.snackbar(
                  "Search can't be empty.",
                  'Please search a valid test package.',
                );
              }
            },
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.black54,
            )),
        isDense: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 35),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 35),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 35),
            borderRadius: BorderRadius.circular(20)),
        hintText: kSearch,
        hintStyle: Get.textTheme.headline6!.copyWith(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class AddPreExistingConditionTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final Function sendPreExistingCondition;

  const AddPreExistingConditionTextFeild({
    Key? key,
    required this.controller,
    required this.sendPreExistingCondition,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (condition) {
        sendPreExistingCondition(condition);
      },
      keyboardType: TextInputType.text,
      cursorColor: kPrimaryColor,
      validator: (preExistingCondition) => preExistingCondition!.length > 2
          ? null
          : 'Please add you pre-existing condition.',
      textCapitalization: TextCapitalization.words,
      style: Get.textTheme.headline6!.copyWith(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        isDense: true,
        hintText: 'Please Add Your Pre-Existing Condition.',
        hintStyle: Get.textTheme.headline6!.copyWith(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class AddPreExistingConditionForFamilyTextFeild extends StatelessWidget {
  final TextEditingController controller;

  const AddPreExistingConditionForFamilyTextFeild({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      cursorColor: kPrimaryColor,
      validator: (preExistingCondition) => preExistingCondition!.length > 2
          ? null
          : "Please add family member's pre-existing condition.",
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8)),
        isDense: true,
        labelText: 'Add Pre-Existing Conditon',
        labelStyle: Get.textTheme.headline6!.copyWith(
            color: kTextFieldBorderColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
