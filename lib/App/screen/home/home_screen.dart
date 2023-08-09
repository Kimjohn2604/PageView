import 'package:app/App/component/colors.dart';
import 'package:app/App/component/styles.dart';
import 'package:app/App/home/widget_home.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> with AutomaticKeepAliveClientMixin<DisplayScreen>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "VietNam",
                          style: AppStyle.headlineStyle1
                              .copyWith(color: Appcolor.mainColor),
                        ),
                        Row(children: [
                          Text(
                            "Tp HCM",
                            style: AppStyle.headlineStyle4
                                .copyWith(color: Appcolor.black),
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ])
                      ],
                    )
                  ],
                ),
              ),
              const FoodPageBody(),
            ],
          ),
        ),
      ),
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
