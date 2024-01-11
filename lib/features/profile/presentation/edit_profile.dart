import 'package:provider/provider.dart';
import 'package:tezda/core/components/app_bar.dart';
import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/components/notification.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:tezda/features/profile/provider/profile_provider.dart';
import 'package:tezda/main.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstnameCon = TextEditingController();
  TextEditingController lastnameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();

  @override
  void initState() {
    final user =
        Provider.of<ProfileProvider>(context, listen: false).currentUser;
    firstnameCon.text = user?.name.firstname ?? '';
    lastnameCon.text = user?.name.lastname ?? '';
    emailCon.text = user?.email ?? '';
    phoneCon.text = user?.phone ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: MyAppBar(
          title: "Profile",
        ),
        body: provider.loading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: ColorPalette.primary,
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 36,
                            horizontal: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: "Personal details",
                                color: ColorPalette.black,
                                size: 18,
                                weight: FontWeight.w700,
                                textAlign: TextAlign.left,
                              ),
                              FormFieldData(
                                title: "Firstname",
                                hintText: "User 001",
                                controller: firstnameCon,
                              ),
                              FormFieldData(
                                title: "Lastname",
                                hintText: "User 001",
                                controller: lastnameCon,
                              ),
                              FormFieldData(
                                title: "Email",
                                hintText: "henryjnr9@gmail.com",
                                paddingTop: 8,
                                controller: emailCon,
                              ),
                              FormFieldData(
                                title: "Add phone",
                                hintText: "UK",
                                paddingTop: 8,
                                controller: phoneCon,
                              ),
                              S.h(80),
                            ],
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: ColorPalette.white,
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: ColorPalette.gray2,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 30, left: 16, right: 16),
                        child: ApplyButton(
                          text: "Save",
                          boderColor: ColorPalette.primary,
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              provider
                                  .saveProfile(
                                      id: 1,
                                      firstname: firstnameCon.text.trim(),
                                      lastname: lastnameCon.text.trim(),
                                      email: emailCon.text.trim(),
                                      phone: phoneCon.text.trim())
                                  .then((value) {
                                if (value) {
                                  showToast(
                                      context, 'Profile successful updated');
                                } else {
                                  FlushBarNotification.showError(
                                      context: context,
                                      message: provider.error);
                                }
                              }).catchError((error) {
                                FlushBarNotification.showError(
                                    context: context, message: error);
                                // showToast(context, 'An error occurred during signing in');
                              });
                            } else {
                              FlushBarNotification.showError(
                                  context: context,
                                  message: 'All fields are required');
                            }
                          },
                          backgroundColor: ColorPalette.primary,
                          textColor: ColorPalette.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}

class MiniContainer extends StatelessWidget {
  final String title;
  const MiniContainer({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.foundationPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: AppText(
            text: title,
            size: 12,
            color: ColorPalette.primary,
            weight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
