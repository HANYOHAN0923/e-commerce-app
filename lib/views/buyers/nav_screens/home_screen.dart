import 'package:e_commerce_app/views/buyers/nav_screens/widgets/banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/search_input_widget.dart';
import 'widgets/welcome_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WelcomeText(),
        SizedBox(
          height: 10,
        ),
        SearchInputWidget(),
        BannerWidget(),
      ],
    );
  }
}
