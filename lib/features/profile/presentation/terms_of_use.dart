import 'package:tezda/core/components/app_bar.dart';
import 'package:flutter/material.dart';

class TermsOfUsePage extends StatefulWidget {
  const TermsOfUsePage({super.key});

  @override
  State<TermsOfUsePage> createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Terms Of Use",
      ),
    );
  }
}
