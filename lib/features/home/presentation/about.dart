import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:tezda/features/home/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  final ProductModel product;
  const AboutPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        S.h(24),
        AppText(
          text: product.title,
          weight: FontWeight.w700,
          size: 24.sp,
          color: ColorPalette.black,
        ),
        S.h(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: "£ ${product.price}",
              weight: FontWeight.w700,
              size: 20.sp,
              color: ColorPalette.black,
            ),
            S.w(8),
            AppText(
              text: "£ ${product.price}",
              weight: FontWeight.w500,
              size: 14.sp,
              color: ColorPalette.black,
              textDecoration: TextDecoration.lineThrough,
            ),
          ],
        ),
        S.h(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppText(
                  text: "1kg per unit",
                  weight: FontWeight.w700,
                  size: 12.sp,
                  color: ColorPalette.purple,
                ),
                S.w(16),
                AppText(
                  text: "Sold by Ajie Stores",
                  weight: FontWeight.w700,
                  size: 16.sp,
                  color: ColorPalette.black,
                ),
              ],
            ),
            AppText(
              text: "100 units remaing",
              weight: FontWeight.w400,
              size: 14.sp,
              color: ColorPalette.gray1,
            ),
          ],
        ),
        S.h(34),
        AppText(
          text: "Product Description",
          weight: FontWeight.w600,
          size: 16.sp,
          color: ColorPalette.black,
        ),
        S.h(24),
        AppText(
          text: product.description,
          weight: FontWeight.w400,
          size: 14.sp,
          color: ColorPalette.black,
        ),
      ],
    );
  }
}
