// ignore_for_file: must_be_immutable

import 'package:tezda/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormFieldData extends StatelessWidget {
  final bool validation;
  final String title;
  final String hintText;
  final Function()? onTap;
  TextEditingController? controller;
  final String prefixString;
  final bool prefix;
  final double paddingTop;
  FormFieldData({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.onTap,
    this.validation = true,
    this.prefixString = "",
    this.prefix = false,
    this.paddingTop = 17,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: AppText(
              text: title,
              size: 14,
              weight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (value) {
              if (validation) {
                if (value == null || value.isEmpty) {
                  return "Please field can't be empty";
                }
              }

              return null;
            },
            controller: controller,
            onTap: onTap,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              filled: true,
              fillColor: Colors.white,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF577D11),
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFD0D5DD),
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFF667085),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'HeyWow',
              ),
              prefixIcon: prefix
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 14, right: 9, top: 14, bottom: 14),
                      child: SvgPicture.asset(
                        prefixString,
                        width: 10,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
