import 'package:tezda/core/components/app_bar.dart';
import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  String? searchValue;
  bool cartEmpty = false;
  @override
  void initState() {
    super.initState();
  }

  final items = List<String>.generate(1, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: MyAppBar(
        title: "Cart",
        press: false,
      ),
      body:
          // cartEmpty
          //     ? Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             SvgPicture.asset(AppIcon.emptyCart),
          //             const Gap(28),
          //             AppText(
          //               text: "Cart’s Empty",
          //               size: 36,
          //               weight: FontWeight.w700,
          //               color: ColorPalette.black400,
          //             ),
          //             const Gap(8),
          //             AppText(
          //               text:
          //                   "Easily add items to your shopping cart and keep track of the as you browse ",
          //               size: 16,
          //               weight: FontWeight.w700,
          //               textAlign: TextAlign.center,
          //             ),
          //             const Gap(64),
          //             ApplyButton(
          //               text: "Search",
          //               icon: AppIcon.shoppingCart,
          //               hasIcon: true,
          //               boderColor: ColorPalette.primary,
          //               press: () {},
          //               backgroundColor: ColorPalette.primary,
          //               textColor: ColorPalette.white,
          //               iconColor: ColorPalette.white,
          //             )
          //           ],
          //         ),
          //       )
          //     :
          Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(item),
                        onDismissed: (direction) {
                          setState(() {
                            items.removeAt(index);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$item dismissed')));
                        },
                        background: Container(
                          color: Colors.red,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 62,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  size: 24,
                                  color: ColorPalette.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: const CartItem(),
                      );
                    },
                  ),
                  S.h(310),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: ColorPalette.white,
              width: double.infinity,
              height: 300.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: AppText(
                            text: "Item Price",
                            weight: FontWeight.w400,
                            size: 16.sp,
                            color: ColorPalette.black,
                          ),
                        ),
                        const Expanded(
                          child: DottedLine(
                            direction: Axis.horizontal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: AppText(
                            text: "£ 200.00",
                            weight: FontWeight.w400,
                            size: 16.sp,
                            color: ColorPalette.black,
                          ),
                        ),
                      ],
                    ),
                    S.h(8),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: AppText(
                            text: "Discount",
                            weight: FontWeight.w400,
                            size: 16.sp,
                            color: ColorPalette.black,
                          ),
                        ),
                        const Expanded(
                          child: DottedLine(
                            direction: Axis.horizontal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: AppText(
                            text: "£ 200.00",
                            weight: FontWeight.w400,
                            size: 16.sp,
                            color: ColorPalette.black,
                          ),
                        ),
                      ],
                    ),
                    S.h(8),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: AppText(
                            text: "Delivery Fee",
                            weight: FontWeight.w400,
                            size: 16.sp,
                            color: ColorPalette.black,
                          ),
                        ),
                        const Expanded(
                          child: DottedLine(
                            direction: Axis.horizontal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: AppText(
                            text: "£ 200.00",
                            weight: FontWeight.w400,
                            size: 16.sp,
                            color: ColorPalette.black,
                          ),
                        ),
                      ],
                    ),
                    S.h(16),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: AppText(
                            text: "Total",
                            weight: FontWeight.w700,
                            size: 16.sp,
                            color: ColorPalette.black,
                          ),
                        ),
                        const Expanded(
                          child: DottedLine(
                            direction: Axis.horizontal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: AppText(
                            text: "£ 200.00",
                            weight: FontWeight.w700,
                            size: 16.sp,
                            color: ColorPalette.black,
                          ),
                        ),
                      ],
                    ),
                    S.h(24),
                    ApplyButton(
                      text: "Make Payment",
                      hasIcon: false,
                      boderColor: ColorPalette.primary,
                      press: () {},
                      backgroundColor: ColorPalette.primary,
                      textColor: ColorPalette.white,
                      iconColor: ColorPalette.white,
                    ),
                    S.h(4),
                    ApplyButton(
                      text: "Continue to Shopping",
                      icon: AppIcon.shoppingCart,
                      hasIcon: true,
                      boderColor: ColorPalette.white,
                      press: () {},
                      backgroundColor: ColorPalette.white,
                      textColor: ColorPalette.primary,
                      iconColor: ColorPalette.primary,
                    ),
                    S.h(16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 9).r,
      decoration: BoxDecoration(
          color: ColorPalette.foundationGray,
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 86.h,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 79.w,
                  height: 69.h,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/10/07/13/36/tangerines-1721590_1280.jpg",
                        ),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                ),
                S.w(8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Product Name",
                      size: 16.sp,
                      weight: FontWeight.w400,
                    ),
                    S.h(8),
                    AppText(
                      text: "£ 100.00",
                      size: 20.sp,
                      weight: FontWeight.w700,
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: 135.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: ColorPalette.gray3,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 46.w,
                    height: 36.h,
                    child: ElevatedButton(
                      onPressed: (() {}),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.w,
                          color: ColorPalette.primary,
                        ),
                        backgroundColor: ColorPalette.primary,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(6),
                      ),
                      child: Center(
                        child: AppText(
                          text: "-",
                          color: ColorPalette.white,
                          size: 18.sp,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  AppText(
                    text: "2",
                    size: 18.sp,
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 46.w,
                    height: 36.h,
                    child: ElevatedButton(
                      onPressed: (() {}),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 1.w,
                          color: ColorPalette.primary,
                        ),
                        backgroundColor: ColorPalette.primary,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(6),
                      ),
                      child: Center(
                        child: AppText(
                          text: "+",
                          color: ColorPalette.white,
                          size: 18.sp,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
