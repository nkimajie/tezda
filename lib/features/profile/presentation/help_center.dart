import 'package:tezda/core/components/app_bar.dart';
import 'package:tezda/core/components/app_text.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  HelpCenterState createState() => HelpCenterState();
}

class HelpCenterState extends State<HelpCenter> {
  bool loggedIn = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isUpdateExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Help Center",
        textColor: ColorPalette.white,
        iconColor: ColorPalette.white,
        backgroundColor: ColorPalette.primary,
      ),
      backgroundColor: ColorPalette.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            // height: 183,
            color: ColorPalette.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  S.h(13),
                  SizedBox(
                    width: 238,
                    child: AppText(
                      text: "How can we help you?",
                      color: ColorPalette.white,
                      size: 30,
                      weight: FontWeight.w700,
                    ),
                  ),
                  S.h(23),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 30,
                            right: 13,
                          ),
                          child: SvgPicture.asset(
                            AppIcon.searchNormal,
                          ),
                        ),
                        fillColor: ColorPalette.white,
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        labelText: 'Search for Products...',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     vertical: 10,
                        //     horizontal: 29,
                        //   ),
                        //   child: SvgPicture.asset(
                        //     AppIcon.filter,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 41,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Frequently Asked Questions",
                      color: ColorPalette.black,
                      size: 16,
                      weight: FontWeight.w700,
                      textAlign: TextAlign.left,
                    ),
                    S.h(16),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        title: AppText(
                          text: "What’s the voice command?",
                          color: ColorPalette.black,
                          size: 16,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                        trailing: Icon(
                          _isUpdateExpanded
                              ? Icons.expand_more_outlined
                              : Icons.chevron_right_outlined,
                          color: ColorPalette.black,
                        ),
                        children: <Widget>[
                          AppText(
                            text:
                                "About ProductLörem ipsum sorad Madeleine Engström. Du kan vara drabbad. Krofask nystartsjobb det vill säga vinde.   Lörem ipsum sorad Madeleine Engström. Du kan vara drabbad. ",
                            color: ColorPalette.black,
                            size: 16,
                            weight: FontWeight.w400,
                            textAlign: TextAlign.left,
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => _isUpdateExpanded = expanded);
                        },
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        title: AppText(
                          text: "What’s the voice command?",
                          color: ColorPalette.black,
                          size: 16,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                        trailing: Icon(
                          _isUpdateExpanded
                              ? Icons.expand_more_outlined
                              : Icons.chevron_right_outlined,
                          color: ColorPalette.black,
                        ),
                        children: <Widget>[
                          AppText(
                            text:
                                "About ProductLörem ipsum sorad Madeleine Engström. Du kan vara drabbad. Krofask nystartsjobb det vill säga vinde.   Lörem ipsum sorad Madeleine Engström. Du kan vara drabbad. ",
                            color: ColorPalette.black,
                            size: 16,
                            weight: FontWeight.w400,
                            textAlign: TextAlign.left,
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => _isUpdateExpanded = expanded);
                        },
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        title: AppText(
                          text: "What’s the voice command?",
                          color: ColorPalette.black,
                          size: 16,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                        trailing: Icon(
                          _isUpdateExpanded
                              ? Icons.expand_more_outlined
                              : Icons.chevron_right_outlined,
                          color: ColorPalette.black,
                        ),
                        children: <Widget>[
                          AppText(
                            text:
                                "About ProductLörem ipsum sorad Madeleine Engström. Du kan vara drabbad. Krofask nystartsjobb det vill säga vinde.   Lörem ipsum sorad Madeleine Engström. Du kan vara drabbad. ",
                            color: ColorPalette.black,
                            size: 16,
                            weight: FontWeight.w400,
                            textAlign: TextAlign.left,
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => _isUpdateExpanded = expanded);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileTabs extends StatelessWidget {
  final String title;
  final String icon;
  final Function press;
  final Color allColor;

  const ProfileTabs({
    required this.title,
    required this.icon,
    required this.press,
    this.allColor = ColorPalette.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius value as needed
          color: ColorPalette
              .foundationGray, // Specify the background color of the container
        ),
        child: ListTile(
          title: AppText(
            text: title,
            color: ColorPalette.black,
            size: 16,
            weight: FontWeight.w400,
          ),
          leading: SvgPicture.asset(
            icon,
            // ignore: deprecated_member_use
            color: ColorPalette.black,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: ColorPalette.black,
            size: 24,
          ),
          onTap: press as void Function(),
        ),
      ),
    );
  }
}
