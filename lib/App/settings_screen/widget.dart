import 'package:app/App/component/colors.dart';
import 'package:app/App/component/dimension.dart';
import 'package:app/App/component/styles.dart';
import 'package:app/App/home/navigator/icons.dart';
import 'package:app/service/constant.dart';
import 'package:app/service/global.dart';
import 'package:flutter/material.dart';

import '../../routes/names.dart';

AppBar buildAppBarProfile() {
  return AppBar(
    backgroundColor: Appcolor.whiteColor,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu),
        Text(
          "Profile",
          style: AppStyle.headlineStyle1.copyWith(color: Appcolor.black),
        ),
        const Icon(Icons.more_vert_outlined),
      ],
    ),
  );
}

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ContainerListView(
        icon: AppIcon(icon: Icons.settings,replaceColr: false,),
        title: 'Setting',
      ),
      ContainerListView(
        icon: AppIcon(icon: Icons.payment,replaceColr: false,),
        title: 'Payment Details',
      ),
      ContainerListView(
        icon: AppIcon(icon: Icons.favorite,replaceColr: false,),
        title: 'Love',
      ),
      ContainerListView(
        icon: AppIcon(icon: Icons.emoji_events,replaceColr: false,),
        title: 'Achievement',
      ),
      ContainerListView(
        icon: AppIcon(icon: Icons.info_outline,replaceColr: false,),
        title: 'About',
      ),
      GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm logout"),
                  content: const Text("Confirm logout"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          Global.storageService
                              .remove(AppConstant.STORAGE_USER_TOKEY_KEY);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              Approutes.SIGN_IN, (route) => false);
                        },
                        child: const Text("OK"))
                  ],
                );
              });
        },
        child: ContainerListView(
          icon: AppIcon(icon: Icons.logout,replaceColr: false,),
          title: 'Log out',
        ),
      ),
    ],
  );
}

Widget ContainerListView({
  required Widget icon,
  required String title,
}) {
  return Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Appcolor.shadeblack,
          blurRadius: 1.0,
          offset: const Offset(0, 3)),
    ], color: Appcolor.whiteColor, borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.only(bottom: 15,left: 30,right: 30),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: icon /* AppIcon(icon: Icons.settings) */,
        ),
        Text(
          title,
          style: AppStyle.headlineStyle3,
        ),
      ],
    ),
  );
}

Widget BuildBottomContainerView() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    margin: const EdgeInsets.only(bottom: 20),
    height: 70,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      BottomContainer(icon: const Icon(Icons.shopping_cart), title: "My shop"),
      BottomContainer(
          icon: const Icon(Icons.add_shopping_cart), title: "Buy more"),
      BottomContainer(icon: const Icon(Icons.star_purple500), title: "My shop"),
    ]),
  );
}

Widget BottomContainer({required Widget icon, required String title}) {
  return Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Appcolor.shadeblack,
          blurRadius: 5.0,
          offset: const Offset(0, 5)),
      BoxShadow(
          color: Appcolor.shadeblack,
          blurRadius: 5.0,
          offset: const Offset(5, 0))
    ], color: Appcolor.iconColor1, borderRadius: BorderRadius.circular(15)),
    width: Dimension.screenWidth / 4.4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          height: 10,
        ),
        Text(title),
      ],
    ),
  );
}
