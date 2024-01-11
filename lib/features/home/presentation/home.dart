// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:tezda/features/home/data/product_model.dart';
import 'package:tezda/features/home/presentation/single_product.dart';
import 'package:tezda/features/home/provider/home_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? searchValue;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).getHomeProduct();
    });
  }

  int _currentIndex = 1;

  final CarouselController _carouselController = CarouselController();

  List<Widget> _buildSlideIndicators(int itemCount, int currentIndex) {
    return List<Widget>.generate(itemCount, (index) {
      return Container(
        width: 19,
        height: 3,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: currentIndex == index
              ? ColorPalette.primary
              : const Color.fromARGB(88, 87, 125, 17),
          borderRadius: BorderRadius.circular(4),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            body: provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: ColorPalette.primary,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0).r,
                          child: Column(
                            children: [
                              S.h(32),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextField(
                                        controller: _searchController,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10.0),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 30,
                                              right: 13,
                                            ).r,
                                            child: SvgPicture.asset(
                                              AppIcon.searchNormal,
                                            ),
                                          ),
                                          fillColor: ColorPalette.white,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                          ),
                                          labelText: 'Search for Products...',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 29,
                                            ).r,
                                            child: SvgPicture.asset(
                                              AppIcon.filter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 23,
                                    ).r,
                                    child: SvgPicture.asset(
                                      AppIcon.notification,
                                    ),
                                  ),
                                ],
                              ),
                              S.h(30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: "Fetured Categories",
                                    weight: FontWeight.w600,
                                    size: 18.sp,
                                    color: ColorPalette.black,
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: "See more",
                                        weight: FontWeight.w700,
                                        size: 14.sp,
                                        color: ColorPalette.black,
                                      ),
                                      S.w(10),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 14.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              S.h(22),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: provider.categories.map((e) {
                                      return CategoryWidget(
                                        textS: e,
                                        callback: () {},
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              S.h(27),
                              CarouselSlider(
                                carouselController: _carouselController,
                                options: CarouselOptions(
                                  height: 131.h,
                                  autoPlay: true, // Enable auto-sliding
                                  autoPlayInterval: const Duration(
                                    seconds: 10,
                                  ), // Set the interval between slides
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: true,
                                  aspectRatio: 2.0,
                                  viewportFraction: 1.0,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      // Update the current slide index
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                items: [
                                  // Add your CarouselItems here
                                  AdsWidget(
                                    urlS:
                                        "https://cdn.pixabay.com/photo/2017/11/29/13/28/a-discount-2986181_1280.jpg",
                                  ),
                                  AdsWidget(
                                    urlS:
                                        "https://cdn.pixabay.com/photo/2023/12/01/19/53/holiday-sale-tags-8424379_1280.jpg",
                                  ),
                                  AdsWidget(
                                    urlS:
                                        "https://cdn.pixabay.com/photo/2018/01/12/13/01/discount-3078217_1280.png",
                                  ),
                                ],
                              ),
                              S.h(16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    _buildSlideIndicators(3, _currentIndex),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: ColorPalette.primary,
                          height: 40.h,
                          width: double.infinity,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: "Top Discounts",
                                  weight: FontWeight.w600,
                                  size: 18.sp,
                                  color: ColorPalette.white,
                                ),
                                //
                              ],
                            ),
                          ),
                        ),
                        S.h(22),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     top: 16,
                        //     right: 16,
                        //     left: 16,
                        //     bottom: 16,
                        //   ),
                        //   child: Consumer<HomeProvider>(builder: (context, value, child) {
                        //     final products = value.product;
                        //     return GridView.builder(
                        //       physics: const NeverScrollableScrollPhysics(),
                        //       shrinkWrap: true,
                        //       gridDelegate:
                        //           const SliverGridDelegateWithFixedCrossAxisCount(
                        //         crossAxisCount: 2,
                        //         crossAxisSpacing: 5.0,
                        //         mainAxisSpacing: 5.0,
                        //         childAspectRatio: 0.49,
                        //       ),
                        //       itemCount: products.length,
                        //       itemBuilder: (context, index) {
                        //         final product = products[index];
                        //         return ProductCard(product: product);
                        //       },
                        //     );
                        //   }),
                        // ),

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            right: 16,
                            left: 16,
                            bottom: 16,
                          ).r,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Consumer<HomeProvider>(
                                builder: (context, value, child) {
                              final products = value.product;
                              return Row(
                                children:
                                    List.generate(products.length, (index) {
                                  final product = products[index];
                                  return ProductCard(product: product);
                                }),
                              );
                            }),
                          ),
                        ),

                        S.h(24),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Trending for Jewelery",
                                weight: FontWeight.w500,
                                size: 18.sp,
                                color: ColorPalette.black,
                              ),
                              Row(
                                children: [
                                  AppText(
                                    text: "See more",
                                    weight: FontWeight.w700,
                                    size: 14.sp,
                                    color: ColorPalette.black,
                                  ),
                                  S.w(10),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14.sp,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        S.h(22),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            right: 16,
                            left: 16,
                            bottom: 16,
                          ).r,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Consumer<HomeProvider>(
                                builder: (context, value, child) {
                              final products = value.jewelery;
                              return Row(
                                children:
                                    List.generate(products.length, (index) {
                                  final product = products[index];
                                  return ProductCard(product: product);
                                }),
                              );
                            }),
                          ),
                        ),
                        S.h(24),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: "Trending Electronics",
                                weight: FontWeight.w500,
                                size: 18.sp,
                                color: ColorPalette.black,
                              ),
                              Row(
                                children: [
                                  AppText(
                                    text: "See more",
                                    weight: FontWeight.w700,
                                    size: 14.sp,
                                    color: ColorPalette.black,
                                  ),
                                  S.w(10),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14.sp,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        S.h(22),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            right: 16,
                            left: 16,
                            bottom: 16,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Consumer<HomeProvider>(
                                builder: (context, value, child) {
                              final products = value.electronics;
                              return Row(
                                children:
                                    List.generate(products.length, (index) {
                                  final product = products[index];
                                  return ProductCard(product: product);
                                }),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  // final Function onClick;
  final ProductModel product;
  const ProductCard({
    // required this.onClick,
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5).r,
      child: Container(
        color: ColorPalette.white,
        width: 193.w,
        height: 370.h,
        child: Stack(
          children: [
            Positioned(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ).r,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleProductPage(
                          product: product,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 174.w,
                    height: 157.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product.image),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // child: const Padding(
                    //   padding: EdgeInsets.only(right: 8.0),
                    //   child: Align(
                    //       alignment: Alignment.topRight,
                    //       child: Icon(
                    //         Icons.favorite_border,
                    //         color: ColorPalette.purple,
                    //       )),
                    // ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 0,
              child: (product.price != 0)
                  ? Container(
                      decoration: const BoxDecoration(
                          color: ColorPalette.purple,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 16,
                          right: 10,
                        ).r,
                        child: AppText(
                          text: "0% OFF",
                          weight: FontWeight.w700,
                          size: 12.sp,
                          color: ColorPalette.white,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            const Positioned(
              top: 16,
              right: 8,
              child: Icon(
                Icons.favorite_border,
                color: ColorPalette.purple,
              ),
            ),
            S.h(8),
            Positioned(
              top: 181,
              bottom: 0,
              left: 8,
              right: 8,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: product.title,
                      weight: FontWeight.w500,
                      size: 16.sp,
                      color: ColorPalette.black,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    S.h(10),
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
                    S.h(4),
                    Row(
                      children: [
                        AppText(
                          text: "Sold by ",
                          weight: FontWeight.w400,
                          size: 10.sp,
                          color: ColorPalette.black,
                        ),
                        AppText(
                          text: "Ajie Stores",
                          weight: FontWeight.w700,
                          size: 12.sp,
                          color: ColorPalette.black,
                        ),
                      ],
                    ),
                    S.h(10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorPalette.primary,
                              size: 12.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: ColorPalette.primary,
                              size: 12.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: ColorPalette.primary,
                              size: 12.sp,
                            ),
                            Icon(
                              Icons.star,
                              color: ColorPalette.primary,
                              size: 12.sp,
                            ),
                            Icon(
                              Icons.star_border,
                              color: ColorPalette.primary,
                              size: 12.sp,
                            ),
                          ],
                        ),
                        S.h(7),
                        AppText(
                          text: "(No reviews yet)",
                          weight: FontWeight.w400,
                          size: 10.sp,
                          color: ColorPalette.black,
                        ),
                      ],
                    ),
                    S.h(19),
                    SizedBox(
                      height: 36.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleProductPage(
                                product: product,
                              ),
                            ),
                          );
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
          ],
        ),
      ),
    );
  }
}

class AdsWidget extends StatelessWidget {
  String urlS;
  AdsWidget({
    required this.urlS,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
            urlS,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String textS;
  final void Function() callback;

  const CategoryWidget({
    super.key,
    required this.textS,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          decoration: ShapeDecoration(
            color: ColorPalette.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15).r,
            ),
          ),
          child: AppText(
            text: textS,
            weight: FontWeight.w700,
            size: 12.sp,
            color: ColorPalette.white,
          ),
        ),
      ),
    );
  }
}
