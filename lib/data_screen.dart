import 'package:baker_st_assignment/constants/colors.dart';
import 'package:baker_st_assignment/constants/constants.dart';
import 'package:baker_st_assignment/custom_widgets.dart';
import 'package:baker_st_assignment/responsive.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive(
          mobile: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CustomWidgets.logoHeader(),
                  const SizedBox(height: 24),
                  CustomWidgets.scoreBoard(),
                  const SizedBox(height: 12),
                  const LoremIpsumList()
                ],
              ),
            ),
          ),
          tablet: const TabletUI(),
        ),
      ),
    );
  }
}

class TabletUI extends StatelessWidget {
  const TabletUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              logoJpg,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomWidgets.scoreBoard(),
                  const SizedBox(height: 12),
                  const LoremIpsumList(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 50),
          const Expanded(
            child: NotificationList(),
          )
        ],
      ),
    );
  }
}
