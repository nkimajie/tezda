import 'package:tezda/core/components/app_bar.dart';
import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/components/notification.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:tezda/features/home/data/product_model.dart';
import 'package:tezda/features/home/presentation/about.dart';
import 'package:tezda/features/home/presentation/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleProductPage extends StatefulWidget {
  final ProductModel product;

  const SingleProductPage({super.key, required this.product});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'About Product'),
    Tab(text: 'Reviews'),
  ];

  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.product.title,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText(
                        text: widget.product.category,
                        size: 14.sp,
                        weight: FontWeight.w700,
                        color: ColorPalette.hexBlack,
                      ),
                      S.w(8),
                      // AppText(
                      //   text: "Category 2",
                      //   size: 14.sp,
                      //   weight: FontWeight.w700,
                      //   color: ColorPalette.hexBlack,
                      // ),
                      // S.w(8),
                      // AppText(
                      //   text: "Category 3",
                      //   size: 14.sp,
                      //   weight: FontWeight.w700,
                      //   color: ColorPalette.hexBlack,
                      // ),
                    ],
                  ),
                  S.h(16),
                  Center(
                    child: Image(
                      image: NetworkImage(
                        widget.product.image,
                      ),
                      height: 301.h,
                    ),
                  ),
                  S.h(24),
                  SizedBox(
                      height: 650,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TabBar(
                                  controller: _tabController,
                                  indicatorColor: ColorPalette.primary,
                                  indicatorWeight: 2,
                                  labelColor: ColorPalette.primary,
                                  unselectedLabelColor: ColorPalette.black400,
                                  isScrollable: true,
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  unselectedLabelStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  tabs: myTabs,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorPalette.foundationPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: ColorPalette.purple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                AboutPage(product: widget.product),
                                const ReviewsPage(),
                              ],
                            ),
                          ),
                        ],
                      )),
                  S.h(90),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: ColorPalette.white,
              width: double.infinity,
              height: 86.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 149.w,
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
                              onPressed: (() {
                                if (_itemCount >= 1) {
                                  setState(() {
                                    _itemCount = _itemCount - 1;
                                  });
                                }
                              }),
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
                            text: _itemCount.toString(),
                            size: 18.sp,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: 46.w,
                            height: 36.h,
                            child: ElevatedButton(
                              onPressed: (() {
                                setState(() {
                                  _itemCount = _itemCount + 1;
                                });
                              }),
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
                    SizedBox(
                      height: 36.h,
                      width: 178.w,
                      child: ElevatedButton(
                        onPressed: (() {
                          if (_itemCount == 0) {
                            FlushBarNotification.showWarning(
                              context: context,
                              message: "No item to add to cart.",
                            );
                          } else {
                            FlushBarNotification.showSuccess(
                              context: context,
                              message: "Added to cart successfully.",
                            );
                          }
                        }),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcon.shoppingCart,
                              // ignore: deprecated_member_use
                              color: ColorPalette.white,
                            ),
                            S.w(10),
                            AppText(
                              text: "Add to Cart",
                              weight: FontWeight.w700,
                              size: 16.sp,
                              color: ColorPalette.white,
                            ),
                          ],
                        ),
                      ),
                    )
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
