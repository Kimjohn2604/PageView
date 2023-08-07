import 'package:app/App/component/styles.dart';
import 'package:flutter/material.dart';

import '../component/colors.dart';
import '../component/dimension.dart';
import '../home/navigator/icons.dart';

class HisToryCart extends StatefulWidget {
  const HisToryCart({super.key});

  @override
  State<HisToryCart> createState() => _HisToryCartState();
}

class _HisToryCartState extends State<HisToryCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              height: 1.0,
            ),
          ),
          backgroundColor: Appcolor.mainColor,
          title: Row(
            children: [
              Text(
                "Your Cart History",
                style: AppStyle.headlineStyle2
                    .copyWith(color: Appcolor.whiteColor),
              ),
              Icon(
                Icons.shopping_basket,
                color: Appcolor.whiteColor,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: ((context, index) {
              return Container(
                  child: Column(children: [
                Text("Ngày và giờ"),
                Container(
                  color: Colors.amberAccent,
                  height: Dimension.pageViewTextContainer2,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                          direction: Axis.horizontal,
                          children: List.generate(3, (index) {
                            return Container(
                              height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Appcolor.shadeblack,
                                        blurRadius: 5.0,
                                        offset: const Offset(0, 5)),
                                  ],
                                  color: Appcolor.mainColor,
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    /* fit: BoxFit.cover, */
                                    image:
                                        AssetImage("assets/image/banhbeo.jpg"),
                                  ),
                                ));
                          })),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text("Total"), Text("3 Items")],
                      )
                    ],
                  ),
                )
              ]));
            }),
          ),
        ));
  }
}
